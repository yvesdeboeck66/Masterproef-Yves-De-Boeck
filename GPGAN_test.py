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
    #print(im_cropped.size)
    #print(im_cropped)
    car_depadded = im_cropped[137:512,0:512]
    im_original[0:375,center-256:center+256,:] = car_depadded
    #cv2.imwrite("restored.png", car)
    return im_original

def create_mask(car):
    im_in = cv2.cvtColor(car,cv2.COLOR_RGB2GRAY)
    print(len(im_in))
    #cv2.imshow("original", im_in)
    # Threshold.
    # Set values equal to or above 0 to 0.
    # Set values below 0 to 255.
    th, im_th = cv2.threshold(im_in, 0, 255, cv2.THRESH_BINARY)
    #stop4 = time.time()
    
    #im_th = cv2.bitwise_not(im_th)
    
    #cv2.imshow("invert", im_th)
    filled = sp.ndimage.binary_fill_holes(im_th).astype(int)
    
    mask = filled*255
    mask = mask.astype('uint8')
    #cv2.imshow("car", im_in)
    #cv2.imshow("mask", filled)
    
    cv2.imwrite("mask10.png", mask)
    
    return mask

    #cv2.imshow("mask", filled)
    #cv2.imshow("background", im_bg)
    #cv2.imshow("colormask", color_mask)
    # get dimensions of image
    #dimensions =im_bg.shape
    #print('Image Dimension    : ', dimensions)
    #cv2.imshow("backgroundaftersubtraction", background)
    #dimensions =car.shape
    #print('Image Dimension    : ', dimensions)
    #cv2.imshow("composite", composite)
    #cv2.waitKey(0)


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
    cv2.imwrite("object.png",obj)
    cv2.imwrite("maskgp.png",mask)
    cv2.imwrite("bg.png",bg)
    # # Init image list
    # if args.list_path:
    #     print('Load images from {} ...'.format(args.list_path))
    #     with open(args.list_path) as f:
    #         test_list = [line.strip().split(';') for line in f]
    #     print('\t {} images in total ...\n'.format(len(test_list)))
    # else:
    #     test_list = [(args.src_image, args.dst_image, args.mask_image)]

    # total_size = len(test_list)
    # for idx in range(total_size):
    #     print('Processing {}/{} ...'.format(idx + 1, total_size))

    # # load image
    # obj = img_as_float(imread(test_list[idx][0]))
    # bg = img_as_float(imread(test_list[idx][1]))
    # mask = imread(test_list[idx][2], as_gray=True).astype(obj.dtype)

    with chainer.using_config("train", False):
        blended_im = gp_gan(obj, bg, mask, net, image_size, gpu, color_weight=color_weight,
                            sigma=sigma,
                            gradient_kernel=gradient_kernel, smooth_sigma=smooth_sigma,
                            supervised=supervised,
                            nz=nz, n_iteration=n_iteration)


    return blended_im
    # if args.blended_image:
    #     imsave(args.blended_image, blended_im)
    #     print('result saved normal')
    # else:
    #     imsave('{}/obj_{}_bg_{}_mask_{}.png'.format(args.result_folder, basename(test_list[idx][0]),
    #                                                 basename(test_list[idx][1]), basename(test_list[idx][2])),
    #           blended_im)
    #     print('result saved other')

    

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

    #filename=sys.argv[1]
    
    print('Input arguments:')
    for key, value in vars(args).items():
        print('\t{}: {}'.format(key, value))
    print('')

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


    car_image = cv2.imread(args.src_image)
    print(car_image.shape)
    cam_im_path = 'original/'+args.src_image.split('/')[2]
    camera_image = cv2.imread(cam_im_path)
    mask = create_mask(car_image)
    composite = create_composite(car_image,mask,camera_image)
    cv2.imwrite('composites/'+args.car_type+'/'+args.src_image.split('/')[2],composite)
    GPGAN_result = harmonize(car_image,camera_image,mask,G,args.image_size,args.gpu, args.color_weight, args.sigma, args.gradient_kernel, args.smooth_sigma, args.supervised, args.nz,args.n_iteration)

    #total_result.save('DIH_output/'+filename.split('/')[1])
    cv2.imwrite('GPGAN_output/'+args.car_type+'/'+args.src_image.split('/')[2],GPGAN_result)
    

if __name__ == "__main__":
    main()