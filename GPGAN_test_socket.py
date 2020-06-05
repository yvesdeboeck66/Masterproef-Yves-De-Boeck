import argparse
import os
import cv2

import chainer
from chainer import cuda, serializers
from skimage import img_as_float
from skimage.io import imread, imsave
import scipy as sp

from gp_gan import gp_gan
from model import EncoderDecoder, DCGAN_G

basename = lambda path: os.path.splitext(os.path.basename(path))[0]
import socket
import socketserver # socketserver in Python 3+
import time
from queue import Queue
from threading import Thread



# class for handling requests
class QueueHandler(socketserver.BaseRequestHandler):
    def __init__(self, request, client_address, server):
        self.server = server
        server.client_address = client_address
        socketserver.BaseRequestHandler.__init__(self,request, client_address, server)

    # receive a block of datas
    # put it in a Queue instance
    # send back the block of data (redundant)  
    def handle(self):
        print("hey")
        data = self.request.recv(4096)
        self.server.recv_q.put(data)
        self.request.send(data)  
    
class TCPServer(socketserver.TCPServer):
    def __init__(self, ip, port, handler_class=QueueHandler):
        socketserver.TCPServer.__init__(self, (ip, port), handler_class, bind_and_activate=False)
        self.recv_q = Queue() # a Queue for data received over the socket
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.server_bind()
        self.server_activate()

    def shutdown(self):
        socketserver.TCPServer.shutdown(self)

    def __del__(self):
        self.server_close()
        
        
# This is the equivalent of the main body of your original code
class DIH_main(object):
    def __init__(self):
        self.value = 1

        # create and instance of the server attached to some port
        self.server = TCPServer("localhost",9999)

        # start it listening in a separate control thread
        self.server_thread = Thread(target=self.server.serve_forever)
        self.server_thread.start()
        self.stop = False
        
        parser = argparse.ArgumentParser(description='Gaussian-Poisson GAN for high-resolution image blending')

        parser.add_argument('--nef', type=int, default=64, help='# of base filters in encoder')
        parser.add_argument('--ngf', type=int, default=64, help='# of base filters in decoder or G')
        parser.add_argument('--nc', type=int, default=3, help='# of output channels in decoder or G')
        parser.add_argument('--nBottleneck', type=int, default=4000, help='# of output channels in encoder')
        parser.add_argument('--ndf', type=int, default=64, help='# of base filters in D')

        parser.add_argument('--image_size', type=int, default=64, help='The height / width of the input image to network')

        parser.add_argument('--color_weight', type=float, default=0.2, help='Color weight')
        parser.add_argument('--sigma', type=float, default=0.5,
                            help='Sigma for gaussian smooth of Gaussian-Poisson Equation')
        parser.add_argument('--gradient_kernel', type=str, default='normal', help='Kernel type for calc gradient')
        parser.add_argument('--smooth_sigma', type=float, default=1, help='Sigma for gaussian smooth of Laplacian pyramid')

        parser.add_argument('--supervised', type=lambda x: x == 'True', default=True,
                            help='Use unsupervised Blending GAN if False')
        parser.add_argument('--nz', type=int, default=200, help='Size of the latent z vector')
        parser.add_argument('--n_iteration', type=int, default=1500, help='# of iterations for optimizing z')

        parser.add_argument('--gpu', type=int, default=0, help='GPU ID (negative value indicates CPU)')
        parser.add_argument('--g_path', default='../models/blending_gan.npz', help='Path for pretrained Blending GAN model')
        parser.add_argument('--unsupervised_path', default='../models/unsupervised_blending_gan.npz',
                            help='Path for pretrained unsupervised Blending GAN model')
        parser.add_argument('--list_path', default='',
                            help='File for input list in csv format: obj_path;bg_path;mask_path in each line')
        parser.add_argument('--result_folder', default='blending_result', help='Name for folder storing results')

        parser.add_argument('--src_image', default='', help='Path for source image')
        parser.add_argument('--dst_image', default='', help='Path for destination image')
        parser.add_argument('--mask_image', default='', help='Path for mask image')
        parser.add_argument('--blended_image', default='', help='Where to save blended image')

        parser.add_argument('--car_type', default='rangerover', help='specify the car type')

        args = parser.parse_args()
        
        self.nef = args.nef
        self.ngf = args.ngf
        self.nc = args.nc
        self.nBottleneck = args.nBottleneck
        self.ndf = args.ndf
        self.image_size = args.image_size
        self.color_weight = args.color_weight
        self.sigma = args.sigma
        self.gradient_kernel = args.gradient_kernel
        self.smooth_sigma = args.smooth_sigma
        self.supervised = args.supervised
        self.nz = args.nz
        self.n_iteration = args.n_iteration
        self.gpu = args.gpu 
        self.g_path =args.g_path
        self.unsupervised_path = args.unsupervised_path
        self.list_path = args.list_path
        self.result_folder = args.result_folder
        self.src_image = args.src_image
        self.dst_image = args.dst_image
        self.mask_image = args.mask_image
        self.blended_image = args.blended_image

        print('Input arguments:')
        for key, value in vars(args).items():
            print('\t{}: {}'.format(key, value))
        print('')

        # Init CNN model
        if args.supervised:
            self.G = EncoderDecoder(args.nef, args.ngf, args.nc, args.nBottleneck, image_size=args.image_size)
            print('Load pretrained Blending GAN model from {} ...'.format(args.g_path))
            serializers.load_npz(args.g_path, self.G)
        else:
            chainer.config.use_cudnn = 'never'
            self.G = DCGAN_G(args.image_size, args.nc, args.ngf)
            print('Load pretrained unsupervised Blending GAN model from {} ...'.format(args.unsupervised_path))
            serializers.load_npz(args.unsupervised_path, self.G)

        if args.gpu >= 0:
            cuda.get_device(args.gpu).use()  # Make a specified GPU current
            self.G.to_gpu()  # Copy the model to the GPU


    #crop the image: allowed values for center: 256, 621, 986
    def crop_image(self, image,center):
        car_cropped = image[0:375,center-256:center+256,:]
        car_padded = cv2.copyMakeBorder( car_cropped, 137, 0, 0, 0, cv2.BORDER_CONSTANT)
        return car_padded

    def restore_image(self, im_cropped,im_original,center):
        car_depadded = im_cropped[137:512,0:512]
        im_original[0:375,center-256:center+256,:] = car_depadded
        return im_original

    def create_mask(self, car):
        im_in = cv2.cvtColor(car,cv2.COLOR_RGB2GRAY)
        print(len(im_in))       
        th, im_th = cv2.threshold(im_in, 0, 255, cv2.THRESH_BINARY)        
        filled = sp.ndimage.binary_fill_holes(im_th).astype(int)
        mask = filled*255
        mask = mask.astype('uint8')
        cv2.imwrite("mask10.png", mask)
        return mask

    def create_composite(self, car,mask,background):
        color_mask = cv2.cvtColor(mask,cv2.COLOR_GRAY2RGB)
        background = cv2.subtract(background,color_mask)
        composite = cv2.add(background,car)
        print("composite created")
        return composite

    def harmonize(self, obj, bg, mask,net,image_size,gpu, color_weight, sigma, gradient_kernel, smooth_sigma, supervised, nz, n_iteration):
        obj = img_as_float(obj)
        bg = img_as_float(bg)
        mask = (255*mask).astype(obj.dtype)
        cv2.imwrite("object.png",obj)
        cv2.imwrite("maskgp.png",mask)
        cv2.imwrite("bg.png",bg)       

        with chainer.using_config("train", False):
            blended_im = gp_gan(obj, bg, mask, net, image_size, gpu, color_weight=color_weight,
                                sigma=sigma,
                                gradient_kernel=gradient_kernel, smooth_sigma=smooth_sigma,
                                supervised=supervised,
                                nz=nz, n_iteration=n_iteration)


        return blended_im
    
    def run(self):
        while not self.stop:
            print ("Value =",self.value)
            
            # if there is stuff in the queue...
            while not self.server.recv_q.empty():

                # read and parse the message from the queue
                filename = self.server.recv_q.get()
                filename = filename.decode()
                print("de filename: " +filename)
                car_image = cv2.imread(filename)
                cam_im_path = 'original/'+filename.split('/')[2]
                camera_image = cv2.imread(cam_im_path)
                mask = self.create_mask(car_image)
                composite = self.create_composite(car_image,mask,camera_image)
                #cv2.imwrite('composites/'+args.car_type+'/'+args.src_image.split('/')[2],composite)
                GPGAN_result = self.harmonize(car_image,camera_image,mask,self.G,self.image_size,self.gpu, self.color_weight, self.sigma, self.gradient_kernel, self.smooth_sigma, self.supervised, self.nz,self.n_iteration)

                cv2.imwrite('GPGAN_output/fastmode/'+filename.split('/')[2],GPGAN_result)

            time.sleep(1)
            
if __name__ == "__main__":
    #main()
    x = DIH_main()
    x.run()