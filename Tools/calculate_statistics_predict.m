function [count,ratio] = load_labels(filename,filename_har)
load(filename);
load(filename_har);
count = 0 ; 
for k = 1 : length(scores_ori)
    if (scores_ori(k)<scores_har(k))
        count = count +1;
    end 
end
ratio = string(count/(length(scores_ori)))