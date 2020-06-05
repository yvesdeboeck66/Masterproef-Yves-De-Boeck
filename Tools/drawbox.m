clear all;
close all; 

results_DIR = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_15\withbox'

%source masks
target_dir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_15\tracklets_labels'; %gets directory
mytargets = dir(fullfile(target_dir,'*.txt')); %gets all txt files in struct

%source images
images_dir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_15\original'; %gets directory
myImages = dir(fullfile(images_dir,'*.png')); %gets all png files in struct

for k = 1:length(myImages)
%     img = imread('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_27\original\0000000007.png');
    %source masks 
      targetFileName = mytargets(k).name;
      fullTargetFileName = fullfile(target_dir, targetFileName);
      fprintf(1, 'Now reading %s\n', fullTargetFileName);
      fid=fopen(fullTargetFileName);
      tline = fgetl(fid);
      fclose(fid);

      %source images
      imageFileName = myImages(k).name;
      fullImageFileName = fullfile(images_dir, imageFileName);
      fprintf(1, 'Now reading %s\n', fullImageFileName);
      source_image = imread(fullImageFileName);


    if ((tline(1)=='C')&&(tline(2)=='a')&&(tline(3)=='r'))

        Key   = ' ';
        Index = strfind(tline, Key);

        % Value = sscanf(tline(Index(1) + length(Key):end), '%g', 1);
        % Value2 = sscanf(tline(Index(2) + length(Key):end), '%g', 1);
        % Value3 = sscanf(tline(Index(3) + length(Key):end), '%g', 1);
        x1 = sscanf(tline(Index(4) + length(Key):end), '%g', 1);
        y1 = sscanf(tline(Index(5) + length(Key):end), '%g', 1);
        x2 = sscanf(tline(Index(6) + length(Key):end), '%g', 1);
        y2 = sscanf(tline(Index(7) + length(Key):end), '%g', 1);

        if (x1<1) 
            x1=1;
        end 

        if (y1<1) 
            y1=1;
        end 

        if (x2>1242) 
            x2=1242;
        end 

        if (y2>375) 
            y2=375;
        end 

        source_image(y1:y2,x1:x2,:) = 0; 
        %imshow(img); 
        %save source image
        
        fullFileName_image = fullfile(results_DIR, imageFileName);
        imwrite(source_image,fullFileName_image);
%         imwrite(img,'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_15\test.png');
    end 
end 


