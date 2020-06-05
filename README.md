# Masterproef Yves De Boeck
 This repository contains the source code for my masterthesis "Improving sensor simulation with artificial intelligence". To accurately test and validate algorithms used in autonomous vehicles, numerous testvehicles and very large datasets are required resulting in safety and financial issues. For this reason, it is desired to train these high data demanding machine-learning algorithms at least partly in simulation. With the development of simulators on the rise, the need for viable real-time synchronization between simulated and real vehicles increases. This synchronization can be achieved by injecting simulated vehicles into the sensor stream of real vehicles. While research using laser rangefinders to accommodate this goal exists, no implementation for the camera sensor has been proposed, given the extra complexities it brings with it. When the manipulated camera frames are not realistic enough, performance loss will occur when moving the trained models from simulation to real-world environment. For this reason, I propose a novel methodology for injecting the presence of simulated vehicles into the camera stream of real vehicles, using deep learning networks to optimize the realism of the resulting frames. 
 
  

## Requirements

## Run app
Follow the following steps to run the app: 
 1) specify location and orientation of desired cars per frame using a tracklet file per frame and put these files in /tracklets_labels
 2) specify background frames and put them in /original
 3) unzip the "blender.zip" file in ./
 (4) if your are using fast mode run the script of the desired harmonization technique first by 
 
 * `python DIH_fast.py` - For Deep Image Harmonization
 * `python GPGAN_fast.py` - For GP-GAN blending
 
 3) run the app using the following command: 
 
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



 
## Validate 

sudo /root/source/notebooks/total_process/blender2.82/blender -b 'kitti_bg_2D_test.blend' -P 'config.py' -- -bm 'GP' -ct 'redrace' 
