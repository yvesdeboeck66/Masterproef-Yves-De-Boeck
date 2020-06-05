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
    cv2.imwrite("composite10.png",composite)
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
    cam_im_path = 'original/'+args.src_image.split('/')[1]
    camera_image = cv2.imread(cam_im_path)
    mask = create_mask(car_image)
    GPGAN_result = harmonize(car_image,camera_image,mask,G,args.image_size,args.gpu, args.color_weight, args.sigma, args.gradient_kernel, args.smooth_sigma, args.supervised, args.nz,args.n_iteration)

    #total_result.save('DIH_output/'+filename.split('/')[1])
    cv2.imwrite('GPGAN_output/'+args.src_image.split('/')[1],GPGAN_result)
    


# def main():
#     import sys       # to get command line args
#     import argparse  # to parse options for us and print a nice help message

#     # get the args passed to blender after "--", all of which are ignored by
#     # blender so scripts may receive their own arguments
#     argv = sys.argv

#     if "--" not in argv:
#         argv = []  # as if no args are passed
#         filename=sys.argv[1]
#     else:
#         argv = argv[argv.index("--") + 1:]  # get all args after "--"

#     # When --help or no args are given, print this help
#     usage_text = (
#         "Run blender in background mode with this script:"
#         "  blender --background --python " + __file__ + " -- [options]"
#     )

#     parser = argparse.ArgumentParser(description=usage_text)

#     # Example utility, add some text and renders or saves it (with options)
#     # Possible types are: string, int, long, choice, float and complex.
#     parser.add_argument(
#         "-fn", "--file_name", dest="file_name", type=str, required=False,
#         help="This is the filename of the result",
#     )


#     args = parser.parse_args(argv)  # In this example we won't use the args



#     if not argv:
#         #print("warning: no arguments were given, taking default values.")
#         parser.print_help()
#         #return

#     if not args.file_name:
#         # print("warning: --gpu=<bool> not specified, gpu enabled by default.")
#         args.file_name = "test_rover"

#     #os.system('sudo /content/blender2.82/blender -b kitti_bg_2D.blend -P config_kitti15.py' )
#     import time
#     car_image = cv2.imread(filename)
#     cam_im_path = 'original/'+filename.split('/')[1]
#     camera_image = cv2.imread(cam_im_path)
    
#     car1 = crop_image(car_image,256)
#     bg1 = crop_image(camera_image,256)
#     mask1 = create_mask(car1)
#     composite1 = create_composite(car1,mask1,bg1)
#     DIH_result1 = harmonize(composite1,mask1)
    
#     car2 = crop_image(car_image,621)
#     bg2 = crop_image(camera_image,621)
#     mask2 = create_mask(car2)
#     composite2 = create_composite(car2,mask2,bg2)
#     DIH_result2 = harmonize(composite2,mask2)
    
#     car3 = crop_image(car_image,986)
#     bg3 = crop_image(camera_image,986)
#     mask3 = create_mask(car3)
#     composite3 = create_composite(car3,mask3,bg3)
#     DIH_result3 = harmonize(composite3,mask3)
    
#     total_result = restore_image(DIH_result1,camera_image,0)
#     total_result = restore_image(DIH_result2,total_result,621)
#     total_result = restore_image(DIH_result3,total_result,986)
#     #total_result.save('DIH_output/'+filename.split('/')[1])
#     cv2.imwrite('DIH_output/'+filename.split('/')[1],total_result)
if __name__ == "__main__":
    main()