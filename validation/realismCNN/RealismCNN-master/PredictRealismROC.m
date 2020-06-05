function PredictRealismROC = load_labels(exp_name, dir_ori, dir_har, isOri, compscore_dir)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% add paths
SetPaths;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% set parameters
exprName = exp_name; % realism_cnn_indoor
MODEL_DIR = '../models/';
IMAGE_FOLD = dir_ori;
IMAGE_FOLD_HAR = dir_har;
DATA_DIR = '../data/Kitti'
WEB_DIR = '../web/';
DISPLAY_TOP_K = 1;
IS_DEDUPLICATE = true;
% initialize vgg network
net_weights = fullfile(MODEL_DIR,'realismCNN_15categories_iter1.caffemodel');
net_model = fullfile(MODEL_DIR,'realismCNN_fc8.prototxt');
use_gpu = 0;
gpu_id = 0;
 
imgFold = fullfile(DATA_DIR, 'images');
webFold = fullfile(WEB_DIR, exprName);
mkdirs(webFold);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% load labels
disp('loading image list and ground truth');
%load(labelFile); %load imgList, labels,  etc.
[imgList, labels, label_strs] = load_labels(dir_ori,dir_har,imgFold); %load imgList, labels,  etc.
%0: unrealistic composite; 1: realistic composite; 2: natural photos
pred_labels = labels;
pred_labels(pred_labels>0.5) = 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% load original image list
imgList_ori = LoadImageList(IMAGE_FOLD);
nImgs = numel(imgList_ori);
imgPaths = AddPaths(IMAGE_FOLD, imgList_ori);

%% load harmonized image list
imgList_har = LoadImageList(IMAGE_FOLD_HAR);
nImgs_har = numel(imgList_har);
imgPaths_har = AddPaths(IMAGE_FOLD_HAR, imgList_har);

if (isOri) 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% realism prediction original images
    scoreFile = fullfile(webFold, 'scores_ori.mat');
    if ~exist(scoreFile, 'file')
        s = CaffeVGGBatch(imgPaths, use_gpu, gpu_id, net_model, net_weights);
        s = cat(2, s{:});
        scores_ori = double(s(2,:));
        save(scoreFile, 'scores_ori');
    else
        fprintf('loading previous results from (%s)\n', scoreFile);
        load(scoreFile, 'scores_ori');
    end
else 
    scoreFile = fullfile(compscore_dir, 'scores_ori.mat');
    fprintf('loading composite scores from previous experiment \n');
    load(scoreFile, 'scores_ori');
end

fprintf("------------------------------- composites processed------------------------------------------------")
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
disp(size(scores_ori))
disp(size(scores_har))
disp(size(pred_labels))
scores = cat(2,scores_ori,scores_har); 
%fprintf('loading previous results from (%s)\n', scores);
disp(size(scores))
[~, tpr, fpr, ~,f]  = prec_rec(scores, pred_labels, 'plotPR',1, 'plotROC', 1);
rocScore = auroc(tpr, fpr);
[count, ratio] = calculate_statistics_predict(scoreFile,scoreFile_har);
disp("Het aantal keer dat harmonizatie een realistischere score gaf: " +string(count));
disp("Succes ratio: " + string(count/(length(scores)/2)))
fprintf('roc score = %3.3f\n', rocScore);
fullgraphname = fullfile(webFold,"ROC&PR.png"')
saveas(f,fullgraphname);

fprintf("------------------------------- harmonized processed------------------------------------------------")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% create a webpage to display top/bottom ranked DISPLAY_TOP_K images
fprintf('creating result webpage (%s)\n', webFold);
html = starthtml;
html = htmlAddTitle(html, sprintf('Experiment Name = %s', exprName));
html = htmlAddTitle(html, sprintf('Number of images = %d', nImgs));
html = htmlAddTitle(html, sprintf('Succesratio = %3.2f', ratio));
html = htmlAddTitle(html, sprintf('ROC Score = %3.3f', rocScore));
outImgFold = 'images'; 
mkdirs(fullfile(webFold, outImgFold)); 
outImgFold_har = 'images_har'; 
mkdirs(fullfile(webFold, outImgFold_har)); 
html = [html sprintf(' <div  text-align="center" halign="center" valign="top" style="word-wrap: break-word;"><p text-align="center" ><a href="%s"><img style="width:%dpx;" src="%s"></a><br>%s</br></p></div>',...
       "ROC&PR.png", 800, "ROC&PR.png", "ROC curve and PR curve")];
flags = {'descend','ascend'};
%names = {'Top', 'Bottom'};
topK = min(DISPLAY_TOP_K, nImgs);  %topk can never be greater than the total number of images.
fprintf(1,'Aantal images: %d \n', nImgs); 
fprintf(1,'Aantal top images: %d \n', topK);

% display original images
%[sort_s,sort_ids] = sort(scores, flags{n});
html = htmlAddTitle(html, sprintf('Original images rated by visual realism'));
html = htmlAddTable(html);
imlinks = cell(topK, 1); 
txts = cell(topK, 1); 
dimensions = size(scores_ori);
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