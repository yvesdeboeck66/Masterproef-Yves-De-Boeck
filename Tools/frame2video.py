import cv2
import numpy as np
import glob

import re

def tryint(s):
    try:
        return int(s)
    except:
        return s

def alphanum_key(s):
    """ Turn a string into a list of string and number chunks.
        "z23a" -> ["z", 23, "a"]
    """
    return [ tryint(c) for c in re.split('([0-9]+)', s) ]

def sort_nicely(l):
    """ Sort the given list in the way that humans expect.
    """
    l.sort(key=alphanum_key)

kitti_list = [13,15,17,27,32,56]
for i in kitti_list:
    dir_list = [
    'C:/Users/yvesk/Documents/Academiejaar2019-2020/Masterproef/IMAGE_COMPOSITION/blender/kitti/kitti_'+str(i)+'/original/',
    'C:/Users/yvesk/Documents/Academiejaar2019-2020/Masterproef/IMAGE_COMPOSITION/blender/kitti/kitti_'+str(i)+'/composites/redrace/',
    'C:/Users/yvesk/Documents/Academiejaar2019-2020/Masterproef/IMAGE_COMPOSITION/blender/kitti/kitti_'+str(i)+'/composites/greenrace/',
    'C:/Users/yvesk/Documents/Academiejaar2019-2020/Masterproef/IMAGE_COMPOSITION/blender/kitti/kitti_'+str(i)+'/composites/rangerover/',
    'C:/Users/yvesk/Documents/Academiejaar2019-2020/Masterproef/IMAGE_COMPOSITION/blender/kitti/kitti_'+str(i)+'/GPGAN_output/redrace/',
    'C:/Users/yvesk/Documents/Academiejaar2019-2020/Masterproef/IMAGE_COMPOSITION/blender/kitti/kitti_'+str(i)+'/GPGAN_output/greenrace/',
    'C:/Users/yvesk/Documents/Academiejaar2019-2020/Masterproef/IMAGE_COMPOSITION/blender/kitti/kitti_'+str(i)+'/GPGAN_output/rangerover/',
    'C:/Users/yvesk/Documents/Academiejaar2019-2020/Masterproef/IMAGE_COMPOSITION/blender/kitti/kitti_'+str(i)+'/DIH_output/redrace/',
    'C:/Users/yvesk/Documents/Academiejaar2019-2020/Masterproef/IMAGE_COMPOSITION/blender/kitti/kitti_'+str(i)+'/DIH_output/greenrace/',
    'C:/Users/yvesk/Documents/Academiejaar2019-2020/Masterproef/IMAGE_COMPOSITION/blender/kitti/kitti_'+str(i)+'/DIH_output/rangerover/']
    for dirname in dir_list:
        img_array = []
        img_list = glob.glob(dirname + '*.png')
        sort_nicely(img_list)
        print(dirname)
        print(len(img_list))
        for filename in img_list:
            img = cv2.imread(filename)
            height, width, layers = img.shape
            size = (width, height)
            img_array.append(img)

        out = cv2.VideoWriter(dirname+dirname.split('/')[10]+'_'+dirname.split('/')[11]+'.avi', cv2.VideoWriter_fourcc(*'DIVX'), 24, size)

        for i in range(len(img_array)):
            out.write(img_array[i])
        out.release()

