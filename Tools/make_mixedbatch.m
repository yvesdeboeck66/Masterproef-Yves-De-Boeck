clear all;
close all; 

% %%% tracklet groudtruths%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% destination = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\tracklets_groundtruths\';
% source = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\tracklets_groundtruths\';
% source_path = string(source)+'*.txt';
% files = dir(source_path);
% for id = 1:length(files)
%     if mod(id-1,6)==0 
%         %[filepath,name,ext] = fileparts(files(id).name);
%         destination_path = string(destination) + files(id).name ;
%         source_path = string(source) + files(id).name;
%         copyfile(source_path,destination_path);
%     end 
% end
% clear all;
% 
% %%% tracklets laels%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% destination = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\tracklets_labels\';
% source = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\tracklets_labels\';
% source_path = string(source)+'*.txt';
% files = dir(source_path);
% for id = 1:length(files)
%     if mod(id-1,6)==0 
%         %[filepath,name,ext] = fileparts(files(id).name);
%         destination_path = string(destination) + files(id).name ;
%         source_path = string(source) + files(id).name;
%         copyfile(source_path,destination_path);
%     end 
% end

% %%% orgial%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% destination = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\original\';
% source = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\original\';
% source_path = string(source)+'*png';
% files = dir(source_path);
% for id = 1:length(files)
%     if mod(id-1,6)==0 
%         %[filepath,name,ext] = fileparts(files(id).name);
%         destination_path = string(destination) + files(id).name ;
%         source_path = string(source) + files(id).name;
%         copyfile(source_path,destination_path);
%     end 
% end

% clear all;
% %%%%composites%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% destination = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\redrace\';
% source = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\composites\redrace\';
% source_path = string(source)+'*png';
% files = dir(source_path);
% for id = 1:length(files)
%     if mod(id-1,6)==0 
%         %[filepath,name,ext] = fileparts(files(id).name);
%         destination_path = string(destination) + files(id).name ;
%         source_path = string(source) + files(id).name;
%         copyfile(source_path,destination_path);
%     end 
% end
% 
% clear all;
% destination = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\greenrace\';
% source = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\composites\greenrace\';
% source_path = string(source)+'*png';
% files = dir(source_path);
% for id = 1:length(files)
%     if mod(id-1,6)==0 
%         %[filepath,name,ext] = fileparts(files(id).name);
%         destination_path = string(destination) + files(id).name ;
%         source_path = string(source) + files(id).name;
%         copyfile(source_path,destination_path);
%     end 
% end
% clear all;
% destination = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\rangerover\';
% source = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\composites\rangerover\';
% source_path = string(source)+'*png';
% files = dir(source_path);
% for id = 1:length(files)
%     if mod(id-1,6)==0 
%         %[filepath,name,ext] = fileparts(files(id).name);
%         destination_path = string(destination) + files(id).name ;
%         source_path = string(source) + files(id).name;
%         copyfile(source_path,destination_path);
%     end 
% end
% 
% 
clear all;
%%%%GPGAN%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
destination = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\GPGAN_output\redrace\';
source = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\GPGAN_output\redrace\';
source_path = string(source)+'*png';
files = dir(source_path);
for id = 1:length(files)
    if mod(id-1,6)==0 
        %[filepath,name,ext] = fileparts(files(id).name);
        destination_path = string(destination) + files(id).name ;
        source_path = string(source) + files(id).name;
        copyfile(source_path,destination_path);
    end 
end

clear all;
destination = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\GPGAN_output\greenrace\';
source = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\GPGAN_output\greenrace\';
source_path = string(source)+'*png';
files = dir(source_path);
for id = 1:length(files)
    if mod(id-1,6)==0 
        %[filepath,name,ext] = fileparts(files(id).name);
        destination_path = string(destination) + files(id).name ;
        source_path = string(source) + files(id).name;
        copyfile(source_path,destination_path);
    end 
end
clear all;
destination = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\GPGAN_output\rangerover\';
source = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\GPGAN_output\rangerover\';
source_path = string(source)+'*png';
files = dir(source_path);
for id = 1:length(files)
    if mod(id-1,6)==0 
        %[filepath,name,ext] = fileparts(files(id).name);
        destination_path = string(destination) + files(id).name ;
        source_path = string(source) + files(id).name;
        copyfile(source_path,destination_path);
    end 
end
clear all;
%%%%DIH%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
destination = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\DIH_output\redrace\';
source = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\DIH_output\redrace\';
source_path = string(source)+'*png';
files = dir(source_path);
for id = 1:length(files)
    if mod(id-1,6)==0 
        %[filepath,name,ext] = fileparts(files(id).name);
        destination_path = string(destination) + files(id).name ;
        source_path = string(source) + files(id).name;
        copyfile(source_path,destination_path);
    end 
end

clear all;
destination = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\DIH_output\greenrace\';
source = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\DIH_output\greenrace\';
source_path = string(source)+'*png';
files = dir(source_path);
for id = 1:length(files)
    if mod(id-1,6)==0 
        %[filepath,name,ext] = fileparts(files(id).name);
        destination_path = string(destination) + files(id).name ;
        source_path = string(source) + files(id).name;
        copyfile(source_path,destination_path);
    end 
end
clear all;
destination = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\DIH_output\rangerover\';
source = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\DIH_output\rangerover\';
source_path = string(source)+'*png';
files = dir(source_path);
for id = 1:length(files)
    if mod(id-1,6)==0 
        %[filepath,name,ext] = fileparts(files(id).name);
        destination_path = string(destination) + files(id).name ;
        source_path = string(source) + files(id).name;
        copyfile(source_path,destination_path);
    end 
end

% 
