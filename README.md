# Masterproef Yves De Boeck
 This repository contains the source code for my masterthesis "Improving sensor simulation with artificial intelligence". I propose a novel methodology for injecting the presence of simulated vehicles into the camera stream of real vehicles, using deep learning networks to optimize the realism of the resulting frames. This code allows you to paste cars on background images according to your specified coordinates and orientation and consequently harmonize these frames using one of two deep learning harmonization techniques. I also validate the realism of these frames by comparing realism scores outputted by a CNN and by submitting the the frames to two object detection systems. 
 
## Techniques used
* Deep image Harmonization - harmonization technique - [github]( https://github.com/wasidennis/DeepHarmonization) - [paper](https://arxiv.org/pdf/1703.00069.pdf)
      
* GP-GAN - harmonization technique - [github](https://github.com/wuhuikai/GP-GAN) - [paper](https://arxiv.org/pdf/1703.07195.pdf)
      
* RealismCNN - realism evaluation technique - [github](https://github.com/junyanz/RealismCNN) - [paper](https://arxiv.org/pdf/1510.00477.pdf)      
      
* YOLOv3 - object detection system - [github](https://github.com/YunYang1994/tensorflow-yolov3) - [paper](https://pjreddie.com/media/files/papers/YOLOv3.pdf)    
      
* R-FCN - object detection system- [github](https://github.com/YuwenXiong/py-R-FCN) - [paper](https://arxiv.org/pdf/1605.06409.pdf)    
 
## Requirements
* Blender2.8 for rendering
* CAFFE for Deep Image Harmonization
* Matlab to make use of the RealismCNN evaluation technique. 
 
All rendering and harmonization was performed on Ubuntu18.03 using a AMD Ryzen Threadripper 3970X 32-Core Processor and NVIDIA TITAN Xp GPU. All evaluation using the object detection systems was performed on the same system. However, RealismCNN was run on windows 10 with a Intel Core i7-7500U CPU. 

## Run app
Follow the following steps to run the app: 
 1) specify location and orientation of desired cars per frame using a label file per frame and put these files in /tracklets_labels
 2) specify background frames and put them in /original
 3) unzip the "blender.zip" file in ./
 (4) if your are using fast mode run the script of the desired harmonization technique first by 
   `python DIH_fast.py` - For Deep Image Harmonization \
   `python GPGAN_fast.py` - For GP-GAN blending
 
 5) run the app using the following command: 
 
 `sudo [/path/to/blender2.82/blender] -b 'kitti.blend' -P 'config.py' -- -bm [harmonization method] -ct [car type] -m [mode] `
 
 e.g. 
 
 `sudo /root/source/blender2.82/blender -b 'kitti.blend' -P 'config.py' -- -bm 'GP' -ct 'redrace'  `
 
   The most important arguments: 
  * `-b` - Runs blender in the background (without GUI)
  * `-P` - To work with a python script to control blender.
  * `-bm` - The "blending_method". Options are "GP" for GP-GAN or "DIH" for Deep Image Harmonization.
  * `-ct` - The "car_type". Currently the kitti.blend file supports 3 car types "redrace", "greenrace" and "rangerover". 
  * `-m` - The "mode". Choose between "normal" or "fast". Fast mode works with a tcp server inside of the harmonization scripts. Instead of waiting for the frame to harmonize the blender script just sends a message and continuis with the next frame. 
  * `-re` - The "render_engine". Choose between "CYCLES" (for more quality but slower rendering) and "BLENDER_EEVEE" to use the real-time renderer of Blender. 
  * `-gpu` - Enable GPU usage for rendering.  
  * `-cpu` - Enable CPU usage for rendering.

  Use the `--help` argument to get a complete list of possible arguments

  6) Results will be written to ./[blending_method]_output/[car_type]/ for normal mode and ./[blending_method]_output/fastmode/ for fast mode. If you used normal mode, the composites will also have been written to ./composites/[car_type]/ before harmonization. 

NOTE:  the tracklets files should containe 1 line per car and have the following format 
 "Car -1 -1 -10 x1 y1 x2 y2 hight width length rotationx rotationy rotationz"
 if you are using kitti recordings you can make use of the matlab script "tracklet_to_label.m" under ./tools/ for extracting the tracklet to the desired label files. 
 
## Validate 
### RealismCNN
To validate the realism of the generated frames you can run RealismCNN. To compare the realism socres between the generated composites (normal mode) and the corresponding harmonized frames for DIH or GP-GAN, follow these steps. 

1) Download the [models](http://efrosprojects.eecs.berkeley.edu/realism/realismCNN_models.zip) and put them under ./validation/realismCNN/models/

2) Run PredictRealismROC.m 
arguments: 
 `exp_name` - Name of your experiment
 `dir_ori` - The directory where your unharmonized composites are saved
 `dir_ori` - The directory where your corresponding harmonized frames are saved.
 `isOri` - Set to 1.
 `compscore_dir` - Set to ''.
 
 e.g. 
 
exp_name = 'kittimix_redrace_compVSdih';
dir_comp = 'kitti\composites\redrace';
dir_har = 'kitti\DIH_output\redrace';
PredictRealismROC(exp_name,dir_comp,dir_har,1,'');

### YOLOv3
To run YOLOv3 on the generated images, follow the following steps:

1) download the [weigths](https://pjreddie.com/media/files/yolov3.weights) of the YOLOv3 model and put it under ./validation/YOLOv3/files/
2) put the images you want to detect under ./validation/YOLOv3/data/
3) in ./validation/YOLOv3/ run the following command

`python run_yolo.py -- -b=[batchsize]` - with batchsize the number of images you put under the /data directory 

OR

run the YOLO_Tensorflow.ipynb notebook

4) The images with the bounding boxes drawn on them will be found written to ./validation/YOLOv3/results/. The files containing a list of all detections are saved to ./validation/YOLOv3/detections/. 

### R-FCN
To run R-FCN on the generated images, follow the following steps:

1) in the directory ./validation download the [R-FCN repository](https://github.com/YuwenXiong/py-R-FCN) and follow the instructions to get it working. 

2) in the ./validation/py-R-FCN/tools/ directory, replace demo_rfcn.py by the rfcn.py in ./validation/

3) make a directory "detections" in ./validation/py-R-FCN/tools/

4) place the images you want to detect in the ./validation/py-R-FCN/data/demo/ directory. 

4) in ./validation/py-R-FCN/tools/ run the following commands

`matplotlib inline` \ /
`python rfcn.py` /
`git clone ` /

5) The images with the bounding boxes drawn on them will be saved in ./validation/py-R-FCN/tools/results/. The files containing a list of all detections are saved to ./validation/py-R-FCN/tools/results/. 

### Determine Average Precision (AP) 
To determine the Average Precision according to the Pascal VOC challenge follow the following steps: 

1) in ./validation download [this](https://github.com/rafaelpadilla/Object-Detection-Metrics.git) repository

2) in ./validation/Object-Detection-Metrics/detections, place the detection files you created with YOLOv3 or R-FCN. In ./validation/Object-Detection-Metrics/groundtruths/ place the label files of the original images. ATTENTION: they require a different format than that of the label file we use for blender. If you are testing on KITTI recordings you can make use of the tracklet_to_label2.m function in ./tools/ to automatically extract the right groundtruth label files from the kitti tracklet xml files. 
