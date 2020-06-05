
import sys 
sys.path.append('/root/caffe/python')
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



print("heeeeeeeeeeeeeeeeeeeeeeeeeeeeey")

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
    stop4 = time.time()
    
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
    # cv2.imwrite("composite10.png",composite)
    print("composite created")
    return composite

def harmonize(composite,mask):
    # result folder
    folder_name = 'DIH_output/'
    if os.path.isdir(folder_name):
        pass
    else:
        os.makedirs(folder_name)
    
    # load test image list
    filename = 'composite9.png'
    # with open(filename, 'r') as f:
    #     path_src = [line.rstrip() for line in f.readlines()]
    #     print(path_src)
    
    # set up caffe
    caffe.set_device(0)
    caffe.set_mode_gpu()
    
     ## redirect output to log file
    # logfile = 'blender_render.log'
    # open(logfile, 'a').close()
    # old = os.dup(1)
    # sys.stdout.flush()
    # os.close(1)
    # os.open(logfile, os.O_WRONLY)
    # load net
    net = caffe.Net('../models/deploy_512.prototxt',
                    '../models/harmonize_iter_200000.caffemodel', caffe.TEST)
                    
    
    # os.close(1)
    # os.dup(old)
    # os.close(old)
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
    net.blobs['data'].reshape(1, *im.shape)
    net.blobs['data'].data[...] = im
    
    net.blobs['mask'].reshape(1, *mask.shape)
    net.blobs['mask'].data[...] = mask

    # run net for prediction
    net.forward()
    out = net.blobs['output-h'].data[0]
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
    size = (512, 512)
    im = cv2.resize(composite,size, interpolation = cv2.INTER_CUBIC)
    im = cv2.cvtColor(im, cv2.COLOR_BGR2RGB)
    im = im.astype('uint8')
    #im = im_ori.resize(size, Image.BICUBIC)
    #im = np.array(im, dtype=np.uint8)
    if im.shape[2] == 4:
        im = im[:, :, 0:3]
    
    end = filename.find('.')
    #result_all = np.concatenate((im, result), axis=1)
    #result_all = Image.fromarray(result_all)
    #result_all.save(folder_name + filename[0:end] + '.png')
    return result
    
  
   

def main():
    import sys       # to get command line args
    import argparse  # to parse options for us and print a nice help message

    # get the args passed to blender after "--", all of which are ignored by
    # blender so scripts may receive their own arguments
    argv = sys.argv

    if "--" not in argv:
        argv = []  # as if no args are passed
        filename=sys.argv[1]
        car_type=sys.argv[2]
    else:
        argv = argv[argv.index("--") + 1:]  # get all args after "--"

    # When --help or no args are given, print this help
    usage_text = (
        "Run blender in background mode with this script:"
        "  blender --background --python " + __file__ + " -- [options]"
    )

    parser = argparse.ArgumentParser(description=usage_text)

    # Example utility, add some text and renders or saves it (with options)
    # Possible types are: string, int, long, choice, float and complex.
    parser.add_argument(
        "-fn", "--file_name", dest="file_name", type=str, required=False,
        help="This is the filename of the result",
    )


    args = parser.parse_args(argv)  # In this example we won't use the args



    if not argv:
        #print("warning: no arguments were given, taking default values.")
        parser.print_help()
        #return

    if not args.file_name:
        # print("warning: --gpu=<bool> not specified, gpu enabled by default.")
        args.file_name = "test_rover"

    #os.system('sudo /content/blender2.82/blender -b kitti_bg_2D.blend -P config_kitti15.py' )
    import time
    car_image = cv2.imread(filename)
    cam_im_path = 'original/'+filename.split('/')[2]
    camera_image = cv2.imread(cam_im_path)
    
    car1 = crop_image(car_image,256)
    bg1 = crop_image(camera_image,256)
    mask1 = create_mask(car1)
    composite1 = create_composite(car1,mask1,bg1)
    cv2.imwrite('composites/'+car_type + '/'+filename.split('/')[2],composite1)
    DIH_result1 = harmonize(composite1,mask1)
    
    car2 = crop_image(car_image,621)
    bg2 = crop_image(camera_image,621)
    mask2 = create_mask(car2)
    composite2 = create_composite(car2,mask2,bg2)
    cv2.imwrite('composites/'+car_type + '/'+filename.split('/')[2],composite2)
    DIH_result2 = harmonize(composite2,mask2)
    
    car3 = crop_image(car_image,986)
    bg3 = crop_image(camera_image,986)
    mask3 = create_mask(car3)
    composite3 = create_composite(car3,mask3,bg3)
    cv2.imwrite('composites/'+car_type + '/'+filename.split('/')[2],composite3)
    DIH_result3 = harmonize(composite3,mask3)
    
    total_result = restore_image(DIH_result1,camera_image,256)
    total_result = restore_image(DIH_result2,total_result,621)
    total_result = restore_image(DIH_result3,total_result,986)
    #total_result.save('DIH_output/'+filename.split('/')[1])
    cv2.imwrite('DIH_output/'+car_type + '/'+filename.split('/')[2],total_result)
if __name__ == "__main__":
    main()