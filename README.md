# Masterproef Yves De Boeck
 This repository contains the source code for my masterthesis "Improving sensor simulation with artificial intelligence". I propose a novel methodology for injecting the presence of simulated vehicles into the camera stream of real vehicles, using deep learning networks to optimize the realism of the resulting frames. This code allows you to paste cars on background images according to your specified coordinates and orientation and consequently harmonize these frames using one of two deep learning harmonization techniques. I also validate the realism of these frames by comparing realism scores outputted by a CNN and by submitting the the frames to two object detection systems. 
 
## Techniques used
* Deep image Harmonization - harmonization technique

      github: https://github.com/wasidennis/DeepHarmonizationhttps://github.com/wasidennis/DeepHarmonization
      
      paper: https://arxiv.org/pdf/1703.00069.pdf
      
* GP-GAN - harmonization technique

      github:  https://github.com/wuhuikai/GP-GAN
      
      paper: https://arxiv.org/pdf/1703.07195.pdf
      
* RealismCNN - realism evaluation technique

      github: https://github.com/junyanz/RealismCNN
      
      paper: https://arxiv.org/pdf/1510.00477.pdf
      
      
* YOLOv3 - object detection system

      github: https://github.com/YunYang1994/tensorflow-yolov3
      
      paper: https://pjreddie.com/media/files/papers/YOLOv3.pdf
      
      
* R-FCN - object detection system

      github: https://github.com/YuwenXiong/py-R-FCN
      
      paper: https://arxiv.org/pdf/1605.06409.pdf      
 
## Requirements
* Blender2.8 for rendering
* CAFFE for Deep Image Harmonization
* Matlab to make use of the RealismCNN evaluation technique. 
 
All tests were run on Ubuntu18.03 using a AMD Ryzen Threadripper 3970X 32-Core Processor and NVIDIA TITAN Xp GPU. 

## Run app
Follow the following steps to run the app: 
 1) specify location and orientation of desired cars per frame using a label file per frame and put these files in /tracklets_labels
 the tracklets files should containe 1 line per car and have the following format 
 "Car -1 -1 -10 x1 y1 x2 y2 hight width length rotationx rotationy rotationz"
 if you are using kitti recordings you can make use of the matlab script "tracklet_to_label.m" under ./tools/ for extracting the tracklet to the desired label files. 
 2) specify background frames and put them in /original
 3) unzip the "blender.zip" file in ./
 (4) if your are using fast mode run the script of the desired harmonization technique first by 
 
   `python DIH_fast.py` - For Deep Image Harmonization
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


## Validate 
To validate the realism of the generated frames you can run RealismCNN using the matlab function 

