clear all;
close all; 

% background1 = imread('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\masktests\kitti1.png'); 
% bw = rgb2gray(background1);
% bw = imbinarize(bw,0.4); 
% imwrite(bw,'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\masktests\kitti1_bw.png');
% 
% background2 = imread('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\masktests\kitti2.png'); 
% bw = rgb2gray(background2);
% bw = imbinarize(bw,0.4);  
% imwrite(bw,'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\masktests\kitti2.png');
% 
% background3 = imread('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\masktests\kitti3.png'); 
% bw = rgb2gray(background3);
% bw = imbinarize(bw,0.4); 
% imwrite(bw,'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\masktests\kitti3.png');

mask_results_DIR = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_27\masks';
image_results_DIR = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_27\frames';

%source images
images_dir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_27\total'; %gets directory
myImages = dir(fullfile(images_dir,'*.png')); %gets all png files in struct

for k = 1:length(myImages)
    
%source images
imageFileName = myImages(k).name;
fullImageFileName = fullfile(images_dir, imageFileName);
fprintf(1, 'Now reading %s\n', fullImageFileName);
source_image = imread(fullImageFileName);
source_mask = rgb2gray(source_image);
source_mask = imbinarize(source_mask,0.4); 
%save source image
filename_image = strcat('frame', num2str(k-1));
filename_image = strcat(filename_image, '.png');
fullFileName_image = fullfile(image_results_DIR, filename_image);
imwrite(source_image,fullFileName_image);

%save mask
filename_mask = strcat('frame', num2str(k-1));
filename_mask = strcat(filename_mask, '.png');
fullFileName_mask = fullfile(mask_results_DIR, filename_mask);
imwrite(source_mask,fullFileName_mask);
end
    