print("test")
import bpy
from math import sqrt
from math import pi
import glob
import pathlib
import os
from os import stat
from os.path import abspath
from mathutils import Vector
import sys
import argparse
path_to_pillow = 'C:/Users/yvesk/AppData/Local/Programs/Python/Python37/Lib/site-packages'
sys.path.append(path_to_pillow)
#from PIL import Image
import numpy as np
import re
import shutil
#from matplotlib import pyplot as plt
#import cv2
#import caffe
# import DIH_test

def set_gpu_cpu(gpu_enabled, cpu_enabled):
    scene = bpy.context.scene
    scene.cycles.device = 'GPU'
    prefs = bpy.context.preferences
    prefs.addons['cycles'].preferences.get_devices()
    cprefs = prefs.addons['cycles'].preferences
    print(cprefs)
    # Attempt to set GPU device types if available
    for compute_device_type in ('OPENCL','CUDA','NONE'):
        try:
            cprefs.compute_device_type = compute_device_type
            print('Device found',compute_device_type)
            break
        except TypeError:
            pass
    for scene in bpy.data.scenes:
        scene.render.tile_x = 256
        scene.render.tile_y = 256
    # Enable all CPU and GPU devices
    print(cprefs.devices)
    for device in cprefs.devices:
        print(device.name)
        if not re.match('intel', device.name, re.I):
            print('Activating gpu',device)
            device.use = gpu_enabled
            print(gpu_enabled)
        else:
            print('Activating cpu', device)
            device.use = cpu_enabled
            print(cpu_enabled)

def set_render_setings(render_engine,samples):
    bpy.context.scene.render.engine = 'CYCLES' #BLENDER_EEVEE/CYCLES
    bpy.context.scene.eevee.taa_render_samples = 5
    # bpy.context.scene.eevee.use_gtao = True
    # bpy.context.scene.eevee.gtao_distance = 0.6
    # bpy.context.scene.eevee.gtao_factor = 0.4
    # bpy.context.scene.eevee.gtao_quality = 0.6
    # bpy.context.scene.eevee.use_gtao_bent_normals = True
    # bpy.context.scene.eevee.use_gtao_bounce = True
    # # bpy.context.scene.eevee.use_sss = True
    # bpy.context.scene.eevee.use_bloom = False
    # bpy.context.scene.eevee.use_ssr = True
    # bpy.context.scene.eevee.use_ssr_halfres = False
    # bpy.context.scene.eevee.ssr_quality = 1
    # bpy.context.scene.eevee.ssr_max_roughness = 0.5
    # bpy.context.scene.eevee.ssr_thickness = 0.2
    # bpy.context.scene.eevee.ssr_border_fade = 0.075
    # bpy.context.scene.eevee.ssr_firefly_fac = 10
    # #bpy.context.scene.eevee.shadow_method = 'VSM'
    # bpy.context.scene.eevee.shadow_cube_size = '1024'
    # bpy.context.scene.eevee.shadow_cascade_size = '1024'
    # bpy.context.scene.eevee.use_shadow_high_bitdepth = True
    # bpy.context.scene.eevee.use_soft_shadows = True
    # bpy.context.scene.eevee.light_threshold = 0.01
    # bpy.context.scene.eevee.gi_diffuse_bounces = 3
    # bpy.context.scene.eevee.gi_cubemap_resolution = '512'
    # bpy.context.scene.eevee.gi_visibility_resolution = '32'
    # bpy.context.scene.eevee.gi_irradiance_smoothing = 1
    # bpy.context.scene.eevee.gi_glossy_clamp = 0
    # bpy.context.scene.eevee.gi_filter_quality = 1
    # bpy.context.scene.eevee.gi_cubemap_display_size = 0.3
    # bpy.context.scene.eevee.gi_irradiance_display_size = 0.1
    # bpy.context.scene.eevee.use_overscan = True
    # bpy.context.scene.view_settings.view_transform = 'Filmic'
    # bpy.context.scene.view_settings.look = 'None'
    # bpy.context.scene.view_settings.exposure = 0
    # bpy.context.scene.view_settings.gamma = 1
    #bpy.context.scene.view_layers["View Layer"].use_pass_normal = True
    #bpy.context.scene.view_layers["View Layer"].use_pass_ambient_occlusion = True

def render_car(filename,camera, zoom, loc_x, loc_y, loc_z, rot_x, rot_y, rot_z, scale):

    #-------------------------------------------------set variables----------
    #------------------------------------------------------via prompt input--

    #vraag locatie car op via cmd
        # camera = input("Geef gewenste camera: ")
        # zoom = input("Geef gewenste zoom: ")
        # loc_x = input("Geef gewenste x-coördinaat: ")
        # loc_y = input("Geef gewenste y-coördinaat: ")
        # loc_z = input("Geef gewenste z-coördinaat: ")
        # rot_x = input("Geef gewenste x-rotatie: ")
        # rot_y = input("Geef gewenste y-rotatie: ")
        # rot_z = input("Geef gewenste z-rotatie: ")

    #maak floats van de strings
        # zoom = float(zoom)
        # loc_x = float(loc_x)
        # loc_y = float(loc_y)
        # loc_z = float(loc_z)
        # rot_x = float(rot_x)
        # rot_y = float(rot_y)
        # rot_z = float(rot_z)

    #---------------------------------------------------via script args---


    #zet de blender objects in een variable
    myObjects = bpy.data.objects

    #zet de gewenste camera in de variable cam
    cam = myObjects[camera]

    #zet de locatie van de car op de oorsprong
    car = myObjects['car.005']
    print(car.location)

    car.location = Vector((0,0,0))
    car.rotation_euler = (0,0,0)

    #om de lens van een camera te kunnen aanpassen moeten we bij cameras zoeken ipv rechstreeks bij het gewenste camera object
    cameras = bpy.data.cameras
    camera1 = cameras[camera]
    camera1.lens

    #zet locatie en camera settings op basis van input
    camera1.lens = zoom
    car.location = Vector((loc_x,loc_y,loc_z))
    car.rotation_euler = (rot_x,rot_y,rot_z)
    print(car.rotation_euler)
    car.scale=(scale,scale,scale)


    #render
    scene = bpy.context.scene
    scene.camera = cam  # set the active camera
    bpy.ops.render.render()




    # import matlab.engine
    # eng = matlab.engine.start_matlab()
    # eng.simple_script(nargout=0)
    # eng.quit()

# def create_composite(car_dir, background_dir):
#     car = Image.open(car_dir)
#     # car = cv2.resize(car,(512,512))
#     background = Image.open(background_dir)
#
#     background.paste(car, (0, 0), car)
#     #background.show('composite', background)
#     background.save("C:/Users/yves/Documents/Academiejaar2019-2020/Masterproef/IMAGE_COMPOSITION/blender/results/composites/test.png")

def main():
    import sys       # to get command line args
    import argparse  # to parse options for us and print a nice help message

    # get the args passed to blender after "--", all of which are ignored by
    # blender so scripts may receive their own arguments
    argv = sys.argv

    if "--" not in argv:
        argv = []  # as if no args are passed
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

    parser.add_argument(
        "-of", "--output_folder", dest="out_folder", type=str, required=False,
        help="This is the result directory",
    )
    
    parser.add_argument(
        "-ct", "--car_type", dest="car_type", type=str, required=False,
        help="Specify which car you'd like, you can choose between a green race car (\"greenrace\"), a yellow rangerover (\"rangerover\"), a pink station wagon (\"pink\") and a red race car (\"redrace\")",
    )
    
    parser.add_argument(
        "-bm", "--blending_method", dest="blending_method", type=str, required=False,
        help="The blending technique used: choose either \"DIH\" (deep image harmonization) or \"GP\" (GP-GAN)",
    )

    parser.add_argument(
        "-gpu", "--gpu_enable", dest="gpu_enable", type=int, required=False,
        help="This value will determine whether the gpu will be used to render",
    )

    parser.add_argument(
        "-cpu", "--cpu_enable", dest="cpu_enable", type=int, required=False,
        help="This value will determine whether the cpu will be used to render",
    )

    parser.add_argument(
        "-c", "--camera", dest="camera", type=str, required=False,
        help="This value will determine the zoom of the camera lens",
    )

    parser.add_argument(
        "-zo", "--zoom", dest="zoom", type=float, required=False,
        help="This value will determine the zoom of the camera lens",
    )

    parser.add_argument(
        "-x", "--x_loc", dest="x_loc", type=float, required=False,
        help="This value will determine the x-coördinate of the car",
    )

    parser.add_argument(
        "-y", "--y_loc", dest="y_loc", type=float, required=False,
        help="This value will determine the x-coördinate of the car",
    )

    parser.add_argument(
        "-z", "--z_loc", dest="z_loc", type=float, required=False,
        help="This value will determine the x-coördinate of the car",
    )

    parser.add_argument(
        "-xr", "--x_rot", dest="x_rot", type=float, required=False,
        help="This value will determine the rotation around the x-as of the car",
    )

    parser.add_argument(
        "-yr", "--y_rot", dest="y_rot", type=float, required=False,
        help="This value will determine the rotation around the y-as of the car",
    )

    parser.add_argument(
        "-zr", "--z_rot", dest="z_rot", type=float, required=False,
        help="This value will determine the rotation around the z-as of the car",
    )

    # parser.add_argument(
    #     "-s", "--save", dest="save_path", metavar='FILE',
    #     help="Save the generated file to the specified path",
    # )
    # parser.add_argument(
    #     "-r", "--render", dest="render_path", metavar='FILE',
    #     help="Render an image to the specified path",
    # )

    args = parser.parse_args(argv)  # In this example we won't use the args



    if not argv:
        #print("warning: no arguments were given, taking default values.")
        parser.print_help()
        #return

    if not args.file_name:
        # print("warning: --file_name=<str> not specified, using "test_rover" by default.")
        args.file_name = "test_rover"
        
    if not args.car_type:
        # print("warning: --car_type=<strl> not specified, using rangerover by default.")
        args.car_type = "rangerover"
        
    if not args.blending_method:
        # print("warning: --blending_method=<str> not specified, using Deep Image Harmonization by default.")
        args.blending_method = "DIH"

    if not args.gpu_enable:
        #print("warning: --gpu=<bool> not specified, gpu enabled by default.")
        args.gpu_enable = False
    else: args.gpu_enable = True

    if not args.cpu_enable:
        #print("warning: --cpu=<bool> not specified, cpu enabled by default.")
        args.cpu_enable = False
    else: args.cpu_enable = True

    if not args.camera:
        print("Warning: --camera=\"cameraname\" not specified, choosing default camera.")
        #parser.print_help()
        args.camera = "Camera"
        #return

    if not args.zoom:
        print("Warning: --zoom=<some_value> not specified, choosing default zoom of 50.")
        # parser.print_help()
        args.zoom = 50
        # return

    if not args.x_loc:
        print("Warning: --x_loc=<some_value> not specified, choosing default x-coordinate of 0.")
        # parser.print_help()
        args.x_loc = 0
        # return
    if not args.y_loc:
        print("Warning: --y_loc=<some_value> not specified, choosing default y-coordinate of 0.")
        # parser.print_help()
        args.y_loc = 0
        # return
    if not args.z_loc:
        print("Warning: --z_loc=<some_value> not specified, choosing default z-coordinate of 0.")
        # parser.print_help()
        args.z_loc = 0

    if not args.x_rot:
        print("Warning: --x_rot=<some_value> not specified, choosing default x-rotation of 0.")
        # parser.print_help()
        args.x_rot = 0
        # return
    if not args.y_rot:
        print("Warning: --y_rot=<some_value> not specified, choosing default y-rotation of 0.")
        # parser.print_help()
        args.y_rot = 0
        # return
    if not args.z_rot:
        print("Warning: --z_rot=<some_value> not specified, choosing default z-rotation of 0.")
        # parser.print_help()
        args.z_rot = 0
        # return

    print(args.gpu_enable)
    print(args.cpu_enable)
    # Set gpu/cpu
    set_gpu_cpu(args.gpu_enable,args.cpu_enable)
    # Set render options
    set_render_setings("RENDER_BLENDER",20)

    result_path = args.out_folder
    tracklet_path = "tracklets_labels/"
    filenames = sorted(glob.glob(tracklet_path + '*.txt'))
    framecount = 0;

    #start frame
    for filename in filenames:
        print()
        print()
        print("Processing frame: " + str(framecount))
        print(filename)
        filepath = result_path + '0000'+filename.split('\\')[1].split('.')[0]+'.png'
        #read tracklet information
        if stat(filename).st_size != 0:

            f = open(filename,"r")
            f1 = f.readlines()
            carcount = 0;
            
            # set the car for each tracklet
            for k in range(0,len(f1)):      #for 1 car per frame change len(f1) to 0
                carcount=carcount+1
                print("setting up car " + str(carcount) +" with tracklet data:")
                print(f1[k])
                arguments = f1[k].split(" ")
                x1 = float(arguments[4])
                y1 = float(arguments[5])
                x2 = float(arguments[6])
                y2 = float(arguments[7])
                h = float(arguments[8])
                w = float(arguments[9])
                l = float(arguments[10])
                tx = float(arguments[11])
                ty = float(arguments[12])
                tz = float(arguments[13])
                rz = float(arguments[14])

                #2D settings
                
                
                if (args.car_type == "rangerover"):
                    scale = 0.309/73.52367*sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1))
                    if ((y2-y1)/(x2-x1) <0.6):
                        scale = scale * (y2-y1)/(x2-x1) *1.6
                if (args.car_type != "rangerover"):
                    scale = 0.324/73.52367*sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1))
                    if ((y2-y1)/(x2-x1) <0.6):
                        scale = scale * (y2-y1)/(x2-x1) *1.6
                
                
                x_loc = 0
                y_loc = ((x1+x2)/2)*0.008052
                z_loc = -((y1+y2)/2)*0.008052
                x_rot = 0
                y_rot = 0
                z_rot = rz
                camera_zoom = 22
                
                

                if (k<=5):
                    #assign a car
                    carname = args.car_type+str(k)
                    car = bpy.data.objects[carname]
                    print("car set")
                else:
                    # make the car
                    carname = args.car_type + str(k)
                    templateCar = bpy.data.objects[args.car_type+'0']
                    car = templateCar.copy()
                    car.data = templateCar.data.copy()
                    bpy.context.collection.objects.link(car)
                    car.name = carname
                    print("extra car added to scene")

               
                #set car location
                car.location = Vector((x_loc, y_loc, z_loc))
                car.rotation_euler = (x_rot, y_rot, z_rot)
                car.scale = (scale, scale, scale)
                #if (args.car_type != "rangerover"):
                    #car.location[2] = -y2*0.008052+car.dimensions[2]/2*car.scale[2]
                print("dimension = "+str(car.dimensions[2]))    
                print("car location = "+str(car.location[2]))

            #render
            print()
            print("Rendering...")
            ## redirect output to log file
            logfile = 'blender_render.log'
            open(logfile, 'a').close()
            old = os.dup(1)
            sys.stdout.flush()
            os.close(1)
            os.open(logfile, os.O_WRONLY)
            
            bpy.ops.render.render()
            
            ## disable output redirection
            os.close(1)
            os.dup(old)
            os.close(old)
            print("frame rendered!")
            
        
            bpy.data.images['Render Result'].save_render(filepath=filepath)
            print()
            print("frame saved")

            print()
            print("cleaning up...")
            # remove cars from frame
            for i in range(0,5):
                bpy.data.objects['rangerover'+str(i)].location = (0, -2, 0)
                bpy.data.objects['greenrace'+str(i)].location = (0, -2, 0)
                bpy.data.objects['redrace'+str(i)].location = (0, -2, 0)
                bpy.data.objects['pink'+str(i)].location = (0, -2, 0)
            

            #delete newly created cars
            # Deselect all
            bpy.ops.object.select_all(action='DESELECT')
            print(carcount)
            if (carcount>6):
                for i in range (0,carcount-6):
                    print("deleting car")
                    carname = args.car_type+str(6+i)
                    bpy.data.objects[carname].select_set(True)  # Blender 2.8x
                    bpy.ops.object.delete()

            print("done!")
           
            
            # print()
            # print("Harmonizing...")
            # if (args.blending_method=="GP"):
            #     print("Harmonizing using GP-GAN...")
            #     os.system('python "GPGAN_test.py" --src_image=%s' % (filepath))
            # else:
            #     print("Harmonizing using Deep Image Harmonization...")
            #     os.system('python "DIH_test.py" %s' % (filepath))
            # #os.system('python "Main.py" %s %s' % (id, value))
            # print("Harmonizing complete!")
            # print()
            
        else:
            if (args.blending_method=="GP"):
                print("No cars in this frame...")
                #print("harmonizing with empty frame...")
                #img = zeros([375,1242,3])
                #os.system('python "GPGAN_test.py" --src_image=%s' % (filepath))
                #shutil.copy('original/'+filepath.split('/')[1], filepath, *, follow_symlinks=True)
            else:
                print("No cars in this frame...")
                #print("copying original frame...")
                #shutil.copy('original/'+filepath.split('/')[1], filepath, *, follow_symlinks=True)
            
            
        framecount = framecount + 1
    print("done")

if __name__ == "__main__":
    main()