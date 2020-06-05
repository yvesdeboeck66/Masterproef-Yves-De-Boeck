#!/usr/bin/env python

# --------------------------------------------------------
# R-FCN
# Copyright (c) 2016 Yuwen Xiong
# Licensed under The MIT License [see LICENSE for details]
# Written by Yuwen Xiong
# --------------------------------------------------------

"""
Demo script showing detections in sample images.

See README.md for installation instructions before running.
"""
import sys
print(sys.path)
import _init_paths
from fast_rcnn.config import cfg
from fast_rcnn.test import im_detect
from fast_rcnn.nms_wrapper import nms
from utils.timer import Timer
import matplotlib.pyplot as plt
import numpy as np
import scipy.io as sio
import caffe, os, sys, cv2
import argparse
import glob

CLASSES = ('__background__',
           'aeroplane', 'bicycle', 'bird', 'boat',
           'bottle', 'bus', 'car', 'cat', 'chair',
           'cow', 'diningtable', 'dog', 'horse',
           'motorbike', 'person', 'pottedplant',
           'sheep', 'sofa', 'train', 'tvmonitor')

NETS = {'ResNet-101': ('ResNet-101',
                  'resnet101_rfcn_final.caffemodel'),
        'ResNet-50': ('ResNet-50',
                  'resnet50_rfcn_final.caffemodel')}


def vis_detections(im, class_name, dets, thresh=0.5):
    """Draw detected bounding boxes."""
    inds = np.where(dets[:, -1] >= thresh)[0]
    if len(inds) == 0:
        return

    im = im[:, :, (2, 1, 0)]
    fig, ax = plt.subplots(figsize=(12, 12))
    ax.imshow(im, aspect='equal')
    for i in inds:
        bbox = dets[i, :4]
        score = dets[i, -1]

        ax.add_patch(
            plt.Rectangle((bbox[0], bbox[1]),
                          bbox[2] - bbox[0],
                          bbox[3] - bbox[1], fill=False,
                          edgecolor='red', linewidth=3.5)
            )
        ax.text(bbox[0], bbox[1] - 2,
                '{:s} {:.3f}'.format(class_name, score),
                bbox=dict(facecolor='blue', alpha=0.5),
                fontsize=14, color='white')

    ax.set_title(('{} detections with '
                  'p({} | box) >= {:.1f}').format(class_name, class_name,
                                                  thresh),
                  fontsize=14)
    plt.axis('off')
    plt.tight_layout()
    plt.draw()

def demo(net, image_name):
    """Detect object classes in an image using pre-computed object proposals."""

    # Load the demo image
    im_file = os.path.join(cfg.DATA_DIR, 'demo', image_name)
    im = cv2.imread(im_file)

    # Detect all object classes and regress object bounds
    timer = Timer()
    timer.tic()
    scores, boxes = im_detect(net, im)
    timer.toc()
    print ('Detection took {:.3f}s for {:d} object proposals'.format(timer.total_time, boxes.shape[0]))

#     # Output tracklet to label file
#     fileID = fopen(sprintf('%s/%06d.txt', output_dir, img_idx) ,'a');
#     # Object label
#     fprintf(fileID,'%s ',tracklets{it}.objectType);
   
#     # 2D boundingbox
#     fprintf(fileID,'%.2f ',box.x1);
#     fprintf(fileID,'%.2f ',box.y1);
#     fprintf(fileID,'%.2f ',box.x2);
#     fprintf(fileID,'%.2f ',box.y2);

   
    
    # Visualize detections for each class
    CONF_THRESH = 0.8
    NMS_THRESH = 0.3
    f = open("detections/"+str(image_name).split('.')[0]+".txt", "a")
    for cls_ind, cls in enumerate(CLASSES[1:]):
        #print(cls_ind)
        cls_ind += 1 # because we skipped background
        cls_boxes = boxes[:, 4:8]
        cls_scores = scores[:, cls_ind]
        if (cls_ind == 7):
            k=0
            for box in cls_boxes:
                f.write(str(CLASSES[7])+' ')
                f.write(str(scores[k,cls_ind])+' ')
                for i in range(0,len(box)):
                    f.write(str(box[i])) 
                    f.write(' ')
                f.write('\n')
                k = k+1
            f.close()
            #print(cls_boxes)
        #print(cls_scores)
        dets = np.hstack((cls_boxes,
                          cls_scores[:, np.newaxis])).astype(np.float32)
        keep = nms(dets, NMS_THRESH)
        dets = dets[keep, :]
        vis_detections(im, cls, dets, thresh=CONF_THRESH)
    plt.savefig("results/"+str(image_name))
    

def parse_args():
    """Parse input arguments."""
    parser = argparse.ArgumentParser(description='Faster R-CNN demo')
    parser.add_argument('--gpu', dest='gpu_id', help='GPU device id to use [0]',
                        default=0, type=int)
    parser.add_argument('--cpu', dest='cpu_mode',
                        help='Use CPU mode (overrides --gpu)',
                        action='store_true')
    parser.add_argument('--net', dest='demo_net', help='Network to use [ResNet-101]',
                        choices=NETS.keys(), default='ResNet-101')

    args = parser.parse_args()

    return args

if __name__ == '__main__':
    cfg.TEST.HAS_RPN = True  # Use RPN for proposals

    args = parse_args()

    prototxt = os.path.join(cfg.MODELS_DIR, NETS[args.demo_net][0],
                            'rfcn_end2end', 'test_agnostic.prototxt')
    caffemodel = os.path.join(cfg.DATA_DIR, 'rfcn_models',
                              NETS[args.demo_net][1])

    if not os.path.isfile(caffemodel):
        raise IOError(('{:s} not found.\n').format(caffemodel))

    if args.cpu_mode:
        caffe.set_mode_cpu()
    else:
        caffe.set_mode_gpu()
        caffe.set_device(args.gpu_id)
        cfg.GPU_ID = args.gpu_id
    
    
    net = caffe.Net(prototxt, caffemodel, caffe.TEST)

    print ('\n\nLoaded network {:s}'.format(caffemodel))

    # Warmup on a dummy image
    im = 128 * np.ones((300, 500, 3), dtype=np.uint8)
    for i in range(2):
        _, _= im_detect(net, im)
        
    im_path = "../data/demo/"
    im_names = sorted(glob.glob(im_path + '*.png'))    
    print(im_names)

#     im_names = [
# #         '001763.jpg', '004545.jpg','testcar1.png','testcar2.png','testcar3.png','testcar14.png','testcar55.png','testcar75.png','testcar92.png','testcar96.png','testcar14_first_pass.png','testcar56_first_pass.png','testcar92_first_pass.png','testcar94_first_pass.png',
#         'frame5.png', 'frame6.png', 'frame7.png','frame109.png', 'frame110.png', 'frame111.png']
    
    for im_name in im_names:
        print ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
        print ('Demo for data/demo/{}'.format(im_name))
        im_name = str(im_name).split('/')[3]
        print(im_name)
        demo(net, im_name)

    plt.show()
    plt.savefig('result.png')
