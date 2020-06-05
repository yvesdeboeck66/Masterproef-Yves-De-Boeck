clear all;
close all; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% add paths
SetPaths;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% set parameters
exprName = 'predict_kitti27_copypasteVSgpgan'; % realism_cnn_indoor
MODEL_DIR = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\Validation\models';
IMAGE_FOLD = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_27\composites';
IMAGE_FOLD_HAR = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti_27\GPGAN_output';
WEB_DIR = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\Validation\web\ranking\';
DISPLAY_TOP_K = 1;
IS_DEDUPLICATE = true;
% initialize vgg network
net_weights = fullfile(MODEL_DIR,'realismCNN_15categories_iter1.caffemodel');
net_model = fullfile(MODEL_DIR,'realismCNN_fc8.prototxt');
use_gpu = 0;
gpu_id = 0;
 
webFold = fullfile(WEB_DIR, exprName);
mkdirs(webFold);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% load original image list
imgList = LoadImageList(IMAGE_FOLD);
nImgs = numel(imgList);
imgPaths = AddPaths(IMAGE_FOLD, imgList);

%% load harmonized image list
imgList_har = LoadImageList(IMAGE_FOLD_HAR);
nImgs_har = numel(imgList_har);
imgPaths_har = AddPaths(IMAGE_FOLD_HAR, imgList_har);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% realism prediction original images
scoreFile = fullfile(webFold, 'scores.mat');
if ~exist(scoreFile, 'file')
    s = CaffeVGGBatch(imgPaths, use_gpu, gpu_id, net_model, net_weights);
    s = cat(2, s{:});
    scores = double(s(2,:));
    save(scoreFile, 'scores');
else
    fprintf('loading previous results from (%s)\n', scoreFile);
    load(scoreFile, 'scores');
end
%% realism prediction harmonized images
scoreFile_har = fullfile(webFold, 'scores_har.mat');
if ~exist(scoreFile_har, 'file')
    s = CaffeVGGBatch(imgPaths_har, use_gpu, gpu_id, net_model, net_weights);
    s = cat(2, s{:});
    scores_har = double(s(2,:));
    save(scoreFile_har, 'scores_har');
else
    fprintf('loading previous results from (%s)\n', scoreFile_har);
    load(scoreFile_har, 'scores_har');
end

[count, ratio] = calculate_statistics_predict(scoreFile,scoreFile_har);
disp("Het aantal keer dat harmonizatie een realistischere score gaf: " +string(count));
disp("Succes ratio: " + string(count/(length(scores))))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% create a webpage to display top/bottom ranked DISPLAY_TOP_K images
fprintf('creating result webpage (%s)\n', webFold);
html = starthtml;
html = htmlAddTitle(html, sprintf('Experiment Name = %s', exprName));
outImgFold = 'images'; 
mkdirs(fullfile(webFold, outImgFold)); 
outImgFold_har = 'images_har'; 
mkdirs(fullfile(webFold, outImgFold_har)); 
flags = {'descend','ascend'};
%names = {'Top', 'Bottom'};
topK = min(DISPLAY_TOP_K, nImgs);  %topk can never be greater than the total number of images.
fprintf(1,'Aantal images: %d \n', nImgs); 
fprintf(1,'Aantal top images: %d \n', topK);

% display original images
%[sort_s,sort_ids] = sort(scores, flags{n});
html = htmlAddTitle(html, sprintf('Original images rated by visual realism'));
html = htmlAddTitle(html, sprintf('Number of images = %d', nImgs));
html = htmlAddTitle(html, sprintf('Succesratio = %3.2f', ratio));
html = htmlAddTable(html);
imlinks = cell(topK, 1); 
txts = cell(topK, 1); 
dimensions = size(scores);
number = dimensions(2);
for k = 1 : number
    id = k; 
    imlinks{k} = fullfile(outImgFold, imgList{id});
    txts{k} = sprintf('score = %3.3f',scores(k)); 
    impath = imgPaths{id}; 
    outpath = fullfile(webFold, imlinks{k}); 
    copyfile(impath, outpath);
end
html = htmlAddImages(html, imlinks, txts, imlinks, 256);
html = htmlEndTable(html);

%display Harmonized images
html = htmlAddTitle(html, sprintf('Harmonized images rated by visual realism'));
html = htmlAddTable(html);
imlinks = cell(topK, 1); 
txts = cell(topK, 1); 
dimensions = size(scores_har);
number = dimensions(2);
for k = 1 : number
    id = k; 
    imlinks{k} = fullfile(outImgFold_har, imgList_har{id});
    txts{k} = sprintf('score = %3.3f',scores_har(k)); 
    impath = imgPaths_har{id}; 
    outpath = fullfile(webFold, imlinks{k}); 
    copyfile(impath, outpath);
end
html = htmlAddImages(html, imlinks, txts, imlinks, 256);
html = htmlEndTable(html);

% for n = 1 : numel(flags)
%     [sort_s,sort_ids] = sort(scores, flags{n});
%     html = htmlAddTitle(html, sprintf('%s ranked %d images by visual realism', names{n}, topK));
%     html = htmlAddTable(html);
%     imlinks = cell(topK, 1); 
%     txts = cell(topK, 1); 
%     for k = 1 : topK
%         id = sort_ids(k); 
%         imlinks{k} = fullfile(outImgFold, imgList{id});
%         txts{k} = sprintf('car%d \t\n score = %3.3f',id,sort_s(k)); 
%         impath = imgPaths{id}; 
%         outpath = fullfile(webFold, imlinks{k}); 
%         copyfile(impath, outpath);
%     end
%     html = htmlAddImages(html, imlinks, txts, imlinks, 256);
%     html = htmlEndTable(html);
% end
htmlWrite(html, webFold);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('done');