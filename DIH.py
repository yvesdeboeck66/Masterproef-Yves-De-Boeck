
import sys 
sys.path.append('/root/caffe/python')
import caffe
import numpy as np
from PIL import Image
import os
import time
import cv2
import numpy as np
import scipy as sp
import scipy.ndimage
import argparse  # to parse options for us and print a nice help message


#crop the image: allowed values for center: 256, 621, 986
def crop_image(image,center):
    car_cropped = image[0:375,center-256:center+256,:]
    car_padded = cv2.copyMakeBorder( car_cropped, 137, 0, 0, 0, cv2.BORDER_CONSTANT)
    return car_padded

# takes a cropped image and a background, pastes the cropped image onto the backgroud based with the center at <center> pixels from the left
def restore_image(im_cropped,im_original,center):
    car_depadded = im_cropped[137:512,0:512]
    im_original[0:375,center-256:center+256,:] = car_depadded
    return im_original

 # creates a binary mask from the <car> object
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
    cv2.imwrite("mask10.png", mask)
    return mask

# uses mask to paste a car object onto a background
def create_composite(car,mask,background):
    color_mask = cv2.cvtColor(mask,cv2.COLOR_GRAY2RGB)
    background = cv2.subtract(background,color_mask)
    composite = cv2.add(background,car)
    print("composite created")
    return composite

# harmonizes the <composite> with <mask> using DIH
def harmonize(composite,mask):
    # load test image list
    filename = 'composite9.png'
    
    # set up caffe
    caffe.set_device(0)
    caffe.set_mode_gpu()
    
    net = caffe.Net('../models/deploy_512.prototxt',
                    '../models/harmonize_iter_200000.caffemodel', caffe.TEST)
      
    size = (512, 512)
   
    # switch to BGR, subtract mean, and make dims C x H x W for Caffe
    im = cv2.resize(composite,size, interpolation = cv2.INTER_CUBIC)
    im = cv2.cvtColor(im, cv2.COLOR_BGR2RGB)
    im = im.astype('float32')
    if im.shape[2] == 4:
        im = im[:, :, 0:3]
    
    im = im[:, :, ::-1]
    im -= np.array((104.00699, 116.66877, 122.67892))
    im = im.transpose((2, 0, 1))

    mask = cv2.resize(mask,size, interpolation = cv2.INTER_CUBIC)
    mask = cv2.cvtColor(mask, cv2.COLOR_BGR2RGB)
    mask = mask.astype('float32')

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
    
    # Get result
    result = out.astype(np.uint8)
    
    # Convert RGB to BGR and put in desired shape
    result = result[:, :, ::-1].copy() 
    size = (512, 512)
    im = cv2.resize(composite,size, interpolation = cv2.INTER_CUBIC)
    im = cv2.cvtColor(im, cv2.COLOR_BGR2RGB)
    im = im.astype('uint8')
    if im.shape[2] == 4:
        im = im[:, :, 0:3]
    
    end = filename.find('.')
    return result
    
  
   

def main():
    
    # get the args passed to the script after
    filename=sys.argv[1]
    car_type=sys.argv[2]
    
    # load the car and background image
    car_image = cv2.imread(filename)
    cam_im_path = 'original/'+filename.split('/')[2]
    camera_image = cv2.imread(cam_im_path)
    
    # split the images in 3 separate 512x512 images since this is the input size of DIH 
    car1 = crop_image(car_image,256)
    car2 = crop_image(car_image,621)
    car3 = crop_image(car_image,986)
    bg1 = crop_image(camera_image,256)
    bg2 = crop_image(camera_image,621)
    bg3 = crop_image(camera_image,986)
    
    # create masks for each image
    mask1 = create_mask(car1)
    mask2 = create_mask(car2)
    mask3 = create_mask(car3)
    
    # create the composite for each image
    composite1 = create_composite(car1,mask1,bg1)
    composite2 = create_composite(car2,mask2,bg2)
    composite3 = create_composite(car3,mask3,bg3)
    
    # save the unharmonized composites
    total_composite = restore_image(composite1, camera_image, 256)
    total_composite = restore_image(composite2, total_composite, 621)
    total_composite = restore_image(composite3, total_composite, 986)
    cv2.imwrite('composites/'+car_type + '/'+filename.split('/')[2],total_composite)
    
    # harmonize the composites
    DIH_result1 = harmonize(composite1,mask1)
    DIH_result2 = harmonize(composite2,mask2)
    DIH_result3 = harmonize(composite3,mask3)    
  
    # concatenate the 3 images back to 1242x375
    total_result = restore_image(DIH_result1,camera_image,256)
    total_result = restore_image(DIH_result2,total_result,621)
    total_result = restore_image(DIH_result3,total_result,986)
    
    # save the result
    cv2.imwrite('DIH_output/'+car_type + '/'+filename.split('/')[2],total_result)
    
if __name__ == "__main__":
    main()