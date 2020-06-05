clear all;
close all; 

cropped = imread('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_15\cropped_test\0000000199.png');
original = imread('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_15\original\0000000199.png');
depadded = cropped(138:512,1:512,:);
original(1:375,1:512,:) = depadded; 

imshow(original); 

% imwrite(padded,'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_15\cropped_test\0000000199.png');
