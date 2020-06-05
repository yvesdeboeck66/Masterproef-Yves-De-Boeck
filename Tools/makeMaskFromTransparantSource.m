function makeMaskFromTransparantSource(composite_results_dir, mask_results_dir, target_dir, images_dir)

composite_results_DIR = composite_results_dir;
mask_results_DIR = mask_results_dir;
%image_results_DIR = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\source_image_result'

% target = imread('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_27\target_images\0000000007.png'); 
% target = imresize(target,[375,1242]);  %set target to 512x512 (maximum in DIH) 
% target_size = size(target); 

%targets
target_dir = target_dir;
mytargets = dir(fullfile(target_dir,'*.png')); %gets all png files in struct

%source images
images_dir = images_dir; %gets directory
myImages = dir(fullfile(images_dir,'*.png')); %gets all png files in struct
for k = 1:length(myImages)
  disp("heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeey");
  %source masks 
  targetFileName = mytargets(k).name;
  fullTargetFileName = fullfile(target_dir, targetFileName);
%   fprintf(1, 'Now reading %s\n', fullTargetFileName);
  target = imread(fullTargetFileName);
%   target_size = size(target)
%   source_mask = imresize(source_mask,[512,512]); %deeplab adds 1 pixel to x and y, convert back to 512x512
%   source_size = size(source_mask)
  
  %source images
  imageFileName = myImages(k).name;
  fullImageFileName = fullfile(images_dir, imageFileName);
%   fprintf(1, 'Now reading %s\n', fullImageFileName);
  source_image = imread(fullImageFileName);
%   orig_image_size = size(source_image)
  %source_image = imresize(source_image,0.5);  %reduce car size
%   source_image_size = size(source_image)
  
  source_mask = rgb2gray(source_image);
  source_mask = im2bw(source_mask,0);
  source_mask = imfill(source_mask,'holes');
  source_mask = 255 * repmat(uint8(source_mask), 1, 1, 3);  
    %erase the part of the target image where to car needs to be pasted using
    %the inverted mask 
    %target_car = bsxfun(@times, target, cast(imcomplement(source_mask), 'like', target)); 
    %target = bsxfun(@times, target, cast(imcomplement(mask), 'like', target)); 
%      target_size = size(target)
    source_mask_size = size(source_mask); 
    target_car = target - source_mask; 
   
    if (k<2)
    figure; imshow(target_car); title('target after mask')
    end

    %the extract only the car out of the source image using the created mask
    %source =  bsxfun(@times, source_image, cast(source_mask, 'like', source_image));
      size(source_image)
    size(source_mask)
    source = source_image - imcomplement(source_mask); 
  
    if (k<2)
    figure; imshow(source); title('car after mask')
    end
    
    %paste the car on the masked target image
    composite = target_car + source; 
    %total_image = target + car; 
    if (k<2)
    figure; imshow(composite); title('total image')
    end 
    
    %figure; 
    %imshow(source);

    %save composite
%     filename_composite = strcat('', num2str(k-1));
%     filename_composite = strcat(filename_composite, '.png');
    fullFileName_composite = fullfile(composite_results_DIR, imageFileName);
    imwrite(composite,fullFileName_composite);
    
%     %save source image
% %     filename_image = strcat('', num2str(k-1));
% %     filename_image = strcat(filename_image, '.png');
%     fullFileName_image = fullfile(image_results_DIR, imageFileName);
%     imwrite(source_image,fullFileName_image);

    %save mask
%     filename_mask = strcat('', num2str(k-1));
%     filename_mask = strcat(filename_mask, '.png');
    fullFileName_mask = fullfile(mask_results_DIR, imageFileName);
    imwrite(source_mask,fullFileName_mask);

end
