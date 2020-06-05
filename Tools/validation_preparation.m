
function [imgList,labels,label_strs] = load_labels(dir_ori, dir_har)
clear all;
%d = uigetdir(pwd, 'Select a folder for original images');
d_ori = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_15\original'
im_ori = dir(fullfile(d_ori, '*.png'));
%d = uigetdir(pwd, 'Select a folder for harmonized images');
d_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_15\composites'
im_har = dir(fullfile(d_har, '*.png'));

file_names = cell(length(im_ori)+length(im_har),1);
labels = []
for k = 1 : length(im_ori)+length(im_har)
    %foreach(files(K).name)
    if (k<=length(im_ori))
        file_names{k} = string(im_ori(k).name);
        labels(k) = 2;
    else 
        file_names{k} = string(im_har(k-length(im_ori)).name);
        labels(k) = 1;
    end 
end

imgList = file_names;
labels = double(transpose(labels)); 
label_strs = cell(1,3);
label_strs{1} = 'unrealistic compsoite';
label_strs{2} = 'realistic composite';
label_strs{3} = 'natural composite';

end



