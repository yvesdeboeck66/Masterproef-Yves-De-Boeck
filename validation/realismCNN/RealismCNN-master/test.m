clear all; 
[count, ratio] = calculate_statistics_predict(scoreFile,scoreFile_har);
disp("Het aantal keer dat harmonizatie een realistischere score gaf: " +string(count));
disp("Succes ratio: " + string(count/length(scores)))

