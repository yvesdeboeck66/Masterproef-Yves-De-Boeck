import math

import numpy as np
import tensorflow.compat.v1 as tf
tf.disable_v2_behavior()
import numpy as np
from PIL import Image, ImageDraw, ImageFont
from IPython.display import display
import glob
from math import sqrt
from math import pi
import glob
import pathlib
import os
from os import stat
from os.path import abspath
#from mathutils import Vector
import sys
import argparse
path_to_pillow = 'C:/Users/yvesk/AppData/Local/Programs/Python/Python37/Lib/site-packages'
sys.path.append(path_to_pillow)
#from PIL import Image
import numpy as np
import re
import shutil



        
        
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
        "-ct", "--car_type", dest="car_type", type=str, required=False,
        help="Specify which car you'd like, you can choose between a green race car (\"greenrace\"), a yellow rangerover (\"rangerover\"), a pink station wagon (\"pink\") and a red race car (\"redrace\")",
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


    result_path = 'composites/'+args.car_type + '_groundtruth/'
    tracklet_path = "tracklets_groundtruths/"
    filenames = sorted(glob.glob(tracklet_path + '*.txt'))
    
    framecount = 0

    #start frame
    for filename in filenames:
        print()
        print()
        print("Processing frame: " + str(framecount))
        print(filename)     
        

        filepath = 'composites/'+ args.car_type + '/' +filename.split('/')[1].split('.')[0]+'.png'

        #read tracklet information
        if stat(filename).st_size != 0:

            f = open(filename,"r")
            f1 = f.readlines()
            carcount = 0;
            img = Image.open(filepath)
            # draw the box for each tracklet
            for k in range(0,len(f1)):      #for 1 car per frame change len(f1) to 0
                carcount=carcount+1
                print("setting up box " + str(carcount) +" with tracklet data:")
                print(f1[k])
                arguments = f1[k].split(" ")
                x1 = float(arguments[1])
                y1 = float(arguments[2])
                x2 = float(arguments[3])
                y2 = float(arguments[4])


                draw = ImageDraw.Draw(img)
                font = ImageFont.truetype(font='files/futur.ttf',
                                          size=(img.size[0] + img.size[1]) // 100)

               
                color = [0, 0, 255]
                x0, y0 = x1, y1
                thickness = (img.size[0] + img.size[1]) // 200
                #text = '{} '.format("car")
                #text_size = draw.textsize(text, font=font)
                for t in np.linspace(0, 1, thickness):
                    x1, y1 = x1 + t, y1 + t
                    x2, y2 = x2 - t, y2 - t
                    draw.rectangle([x1, y1, x2, y2], outline=tuple(color))
#                     draw.rectangle(
#                     [x0, y0 - text_size[1], x0 + text_size[0], y0],
#                     fill=tuple(color))


             #display(img)
            name = filepath.split('/')[2]
            img = img.save(result_path+str(name)) 


        else:
            print("No cars in this frame...")

            
        framecount = framecount + 1
    print("done")

if __name__ == "__main__":
    main()