%source masks
masks_dir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_27'; %gets directory
myMasks = dir(fullfile(masks_dir,'*.png')); %gets all png files in struct

for k = 1:length(myMasks)
  maskFileName = myMasks(k).name;
  fullMaskFileName = fullfile(masks_dir, maskFileName);
  fprintf(1, 'Now reading %s\n', fullMaskFileName);
  source_mask = imread(fullMaskFileName);
  orig_mask_size = size(source_mask)
  source_mask = imresize(source_mask,[375,1242]); %deeplab adds 1 pixel to x and y, convert back to 512x512
 

%save mask
    imwrite(source_mask,fullMaskFileName);
    
end 
