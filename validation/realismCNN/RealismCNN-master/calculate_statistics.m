function [count,ratio] = load_labels(filename)
load(filename);
count = 0 ; 
for k = 1 : length(scores)/2
    if (scores(k)<scores(k+length(scores)/2))
        count = count +1;
    end 
end
ratio = string(count/(length(scores)/2))
