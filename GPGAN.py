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

"""
    Note: source image, destination image and mask image have the same size.
"""

#crop the image: allowed values for center: 256, 621, 986
def crop_image(image,center):
    car_cropped = image[0:375,center-256:center+256,:]
    car_padded = cv2.copyMakeBorder( car_cropped, 137, 0, 0, 0, cv2.BORDER_CONSTANT)
    #cv2.imwrite("cropped.png", car_padded)
    return car_padded
    
def restore_image(im_cropped,im_original,center):
    car_depadded = im_cropped[137:512,0:512]
    im_original[0:375,center-256:center+256,:] = car_depadded
    #cv2.imwrite("restored.png", car)
    return im_original

def create_mask(car):
    im_in = cv2.cvtColor(car,cv2.COLOR_RGB2GRAY)
    print(len(im_in))
    # Threshold.
    # Set values equal to or above 0 to 0.
    # Set values below 0 to 255.
    th, im_th = cv2.threshold(im_in, 0, 255, cv2.THRESH_BINARY)
    filled = sp.ndimage.binary_fill_holes(im_th).astype(int)
    mask = filled*255
    mask = mask.astype('uint8')
    #cv2.imwrite("mask10.png", mask)
    return mask

def create_composite(car,mask,background):
    
    color_mask = cv2.cvtColor(mask,cv2.COLOR_GRAY2RGB)
    background = cv2.subtract(background,color_mask)
    composite = cv2.add(background,car)
    print("composite created")
    return composite
    
def harmonize(obj, bg, mask,net,image_size,gpu, color_weight, sigma, gradient_kernel, smooth_sigma, supervised, nz, n_iteration):
    obj = img_as_float(obj)
    bg = img_as_float(bg)
    mask = (255*mask).astype(obj.dtype)
   
    # run GP-GAN with all parameters that were specified as arguments for the script
    with chainer.using_config("train", False):
        blended_im = gp_gan(obj, bg, mask, net, image_size, gpu, color_weight=color_weight,
                            sigma=sigma,
                            gradient_kernel=gradient_kernel, smooth_sigma=smooth_sigma,
                            supervised=supervised,
                            nz=nz, n_iteration=n_iteration)

    return blended_im
  

    

def main():
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


    for key, value in vars(args).items():
        print('\t{}: {}'.format(key, value))

    # Init CNN model
    if args.supervised:
        G = EncoderDecoder(args.nef, args.ngf, args.nc, args.nBottleneck, image_size=args.image_size)
        print('Load pretrained Blending GAN model from {} ...'.format(args.g_path))
        serializers.load_npz(args.g_path, G)
    else:
        chainer.config.use_cudnn = 'never'
        G = DCGAN_G(args.image_size, args.nc, args.ngf)
        print('Load pretrained unsupervised Blending GAN model from {} ...'.format(args.unsupervised_path))
        serializers.load_npz(args.unsupervised_path, G)

    if args.gpu >= 0:
        cuda.get_device(args.gpu).use()  # Make a specified GPU current
        G.to_gpu()  # Copy the model to the GPU

    # load car image based on name that was given by blender script
    car_image = cv2.imread(args.src_image)
    
    # Load background image based on name that was given by blender script
    cam_im_path = 'original/'+args.src_image.split('/')[2]
    camera_image = cv2.imread(cam_im_path)
    
    # Create mask
    mask = create_mask(car_image)
    
    # Create composite
    composite = create_composite(car_image,mask,camera_image)
    cv2.imwrite('composites/'+args.car_type+'/'+args.src_image.split('/')[2],composite)
    
    # Harmonize the composite
    GPGAN_result = harmonize(car_image,camera_image,mask,G,args.image_size,args.gpu, args.color_weight, args.sigma, args.gradient_kernel, args.smooth_sigma, args.supervised, args.nz,args.n_iteration)

    # Save the result
    cv2.imwrite('GPGAN_output/'+args.car_type+'/'+args.src_image.split('/')[2],GPGAN_result)
    

if __name__ == "__main__":
    main()