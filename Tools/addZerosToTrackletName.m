clear;
cd 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\tracklets_groundtruths';
files = dir('*.txt');
% Loop through each file 
for id = 1:length(files)
    %disp(files(id).name);
    % Get the file name 
    % Get the file name 
    [~, f,ext] = fileparts(files(id).name);
    rename = strcat('0000',f,ext) ; 
    movefile(files(id).name, rename); 
end
