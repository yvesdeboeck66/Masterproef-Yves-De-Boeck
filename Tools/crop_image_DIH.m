clear all;
close all; 

source_image = imread('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_15\composites\0000000199.png');
source_mask = imread('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_15\source_masks\0000000199.png');
cropped = source_image(1:375,1:512,:);
cropped_mask = source_mask(1:375,1:512,:);
imshow(cropped); 
padded = padarray(cropped,137,0,'pre');
padded_mask = padarray(cropped_mask,137,0,'pre');
figure;
imshow(padded);
imwrite(padded,'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_15\cropped_test\0000000199.png');
imwrite(padded_mask,'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_15\cropped_test_mask\0000000199.png');
