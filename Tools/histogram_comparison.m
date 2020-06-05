clear all;
close all; 

original = imread('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\original\0000000221.png');
figure;imshow(original)
figure;
imhist(original);

comp = imread('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\composites\rangerover\0000000221.png');
figure;imshow(comp)
figure;
imhist(comp);


har = imread('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\DIH_output\rangerover\0000000221.png');
figure;
imshow(har)
figure;
imhist(har);


gray_comp = rgb2gray(comp);
imtool(gray_comp)

gray_har = rgb2gray(har);
imtool(gray_har)