#!/usr/bin/env python

import caffe
import numpy as np
from PIL import Image
import os
import time
import cv2
#from PIL import Image
import numpy as np
import scipy as sp
import scipy.ndimage
import sys 
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
        
        # result folder
        folder_name = 'DIH_output/'
        if os.path.isdir(folder_name):
            pass
        else:
            os.makedirs(folder_name)

        # set up caffe
        caffe.set_device(0)
        caffe.set_mode_gpu()

        # load net
        self.net = caffe.Net('../models/deploy_512.prototxt',
                    '../models/harmonize_iter_200000.caffemodel', caffe.TEST)


    def add_one_to_value(self):
        self.value += 1

    #crop the image: allowed values for center: 256, 621, 986
    def crop_image(self, image,center):
        car_cropped = image[0:375,center-256:center+256,:]
        car_padded = cv2.copyMakeBorder( car_cropped, 137, 0, 0, 0, cv2.BORDER_CONSTANT)
        #cv2.imwrite("cropped.png", car_padded)
        return car_padded
    
    def restore_image(self, im_cropped,im_original,center):
        #print(im_cropped.size)
        #print(im_cropped)
        car_depadded = im_cropped[137:512,0:512]
        im_original[0:375,center-256:center+256,:] = car_depadded
        #cv2.imwrite("restored.png", car)
        return im_original

    def create_mask(self, car):
        im_in = cv2.cvtColor(car,cv2.COLOR_RGB2GRAY)
        print(len(im_in))
      
        th, im_th = cv2.threshold(im_in, 0, 255, cv2.THRESH_BINARY)
        stop4 = time.time()

        filled = sp.ndimage.binary_fill_holes(im_th).astype(int)

        mask = filled*255
        mask = mask.astype('uint8')


        return mask


    def create_composite(self, car,mask,background):

        color_mask = cv2.cvtColor(mask,cv2.COLOR_GRAY2RGB)
        background = cv2.subtract(background,color_mask)
        composite = cv2.add(background,car)
        # cv2.imwrite("composite10.png",composite)
        print("composite created")
        return composite

    def harmonize(self,composite,mask):
        # result folder
        #folder_name = 'DIH_output/'
        #if os.path.isdir(folder_name):
        #    pass
        #else:
        #    os.makedirs(folder_name)

  
        print("joooooooooooooooooooooooooooooooooooooooooooooooooooooooooooow")
        size = (512, 512)
        # for idx, path_ in enumerate(path_src):
        # load image, switch to BGR, subtract mean, and make dims C x H x W for Caffe

        #im_ori = Image.open('data/image/' + filename)
        im = cv2.resize(composite,size, interpolation = cv2.INTER_CUBIC)
        im = cv2.cvtColor(im, cv2.COLOR_BGR2RGB)
        im = im.astype('float32')
        #im = np.array(im, dtype=np.float32)
        if im.shape[2] == 4:
            im = im[:, :, 0:3]

        im = im[:, :, ::-1]
        im -= np.array((104.00699, 116.66877, 122.67892))
        im = im.transpose((2, 0, 1))

        #mask = Image.open('data/mask/' + filename)
        mask = cv2.resize(mask,size, interpolation = cv2.INTER_CUBIC)
        mask = cv2.cvtColor(mask, cv2.COLOR_BGR2RGB)
        mask = mask.astype('float32')
        #mask = np.array(mask, dtype=np.float32)
        if len(mask.shape) == 3:
            mask = mask[:, :, 0]

        mask -= 128.0
        mask = mask[np.newaxis, ...]

        # shape for input (data blob is N x C x H x W), set data
        self.net.blobs['data'].reshape(1, *im.shape)
        self.net.blobs['data'].data[...] = im

        self.net.blobs['mask'].reshape(1, *mask.shape)
        self.net.blobs['mask'].data[...] = mask

        # run net for prediction
        self.net.forward()
        out = self.net.blobs['output-h'].data[0]
        out = out.transpose((1, 2, 0))
        out += np.array((104.00699, 116.66877, 122.67892))
        out = out[:, :, ::-1]

        neg_idx = out < 0.0
        out[neg_idx] = 0.0
        pos_idx = out > 255.0
        out[pos_idx] = 255.0

        # save result
        result = out.astype(np.uint8)
        # Convert RGB to BGR 
        result = result[:, :, ::-1].copy() 
        #result = Image.fromarray(result.astype('uint8'), mode='RGB')
        #size = (512, 512)
        #im = cv2.resize(composite,size, interpolation = cv2.INTER_CUBIC)
        #im = cv2.cvtColor(im, cv2.COLOR_BGR2RGB)
        #im = im.astype('uint8')
        #im = im_ori.resize(size, Image.BICUBIC)
        #im = np.array(im, dtype=np.uint8)
        #if im.shape[2] == 4:
        #    im = im[:, :, 0:3]

        #end = filename.find('.')
        #result_all = np.concatenate((im, result), axis=1)
        #result_all = Image.fromarray(result_all)
        #result_all.save(folder_name + filename[0:end] + '.png')
        return result

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
                cam_im_path = 'original/' + filename.split('/')[2]
                camera_image = cv2.imread(cam_im_path)
                
                car1 = self.crop_image(car_image, 256)
                bg1 = self.crop_image(camera_image, 256)
                mask1 = self.create_mask(car1)
                composite1 = self.create_composite(car1, mask1, bg1)
                DIH_result1 = self.harmonize(composite1, mask1)
                
                car2 = self.crop_image(car_image, 621)
                bg2 = self.crop_image(camera_image, 621)
                mask2 = self.create_mask(car2)
                composite2 = self.create_composite(car2, mask2, bg2)
                DIH_result2 = self.harmonize(composite2, mask2)
                
                car3 = self.crop_image(car_image, 986)
                bg3 = self.crop_image(camera_image, 986)
                mask3 = self.create_mask(car3)
                composite3 = self.create_composite(car3, mask3, bg3)
                DIH_result3 = self.harmonize(composite3, mask3)
                
                total_composite = self.restore_image(composite1, camera_image, 256)
                total_composite = self.restore_image(composite2, total_composite, 621)
                total_composite = self.restore_image(composite3, total_composite, 986)
                # cv2.imwrite('composites/'+car_type + '/'+filename.split('/')[2],total_composite)
                total_result = self.restore_image(DIH_result1, camera_image, 256)
                total_result = self.restore_image(DIH_result2, total_result, 621)
                total_result = self.restore_image(DIH_result3, total_result, 986)
                # total_result.save('DIH_output/'+filename.split('/')[1])
                cv2.imwrite('DIH_output/fastmode/' + filename.split('/')[2], total_result)

                # perform some action based on the message
                if filename == "add":
                   self.add_one_to_value()
                elif filename == "shutdown":
                   self.server.shutdown()
                   self.stop = True

            time.sleep(1)
            
if __name__ == "__main__":
    #main()
    x = DIH_main()
    x.run()