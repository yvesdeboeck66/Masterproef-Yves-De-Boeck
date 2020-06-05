
function [imgList,labels,label_strs] = load_labels(dir_ori, dir_har, dir_im)
%clear all;
%d = uigetdir(pwd, 'Select a folder for original images');
d_ori = dir_ori
im_ori = dir(fullfile(d_ori, '*.png'));
%d = uigetdir(pwd, 'Select a folder for harmonized images');
d_har = dir_har
im_har = dir(fullfile(d_har, '*.png'));

filePattern = fullfile(dir_im, '*.png'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(dir_im, baseFileName);
  fprintf(1, 'Now deleting %s\n', fullFileName);
  delete(fullFileName);
end

file_names = cell(length(im_ori)+length(im_har),1);
labels = []
for k = 1 : (length(im_ori)+length(im_har))
    %foreach(files(K).name)
    if (k<=length(im_ori))
        index = strfind(string(im_ori(k).name), '.');
        file_names{k} = im_ori(k).name(1:index-1)+"_ori.png";
        fullFileName = fullfile(dir_ori, string(im_ori(k).name));
        im = imread(fullFileName);
        labels(k) = 0;
    else 
        index = strfind(string(im_har(k-length(im_ori)).name), '.');
        file_names{k} = im_har(k-length(im_ori)).name(1:index-1)+"_har.png";
        fullFileName = fullfile(dir_har, string(im_har(k-length(im_ori)).name));
        im = imread(fullFileName);
        labels(k) = 1;
    end 
    
    fullFileName = fullfile(dir_im, file_names{k});
    disp(fullFileName);
    imwrite(im, fullFileName);
end

imgList = file_names;
labels = double(transpose(labels)); 
label_strs = cell(1,2);
label_strs{1} = 'unrealistic composite';
label_strs{2} = 'realistic composite';

end



