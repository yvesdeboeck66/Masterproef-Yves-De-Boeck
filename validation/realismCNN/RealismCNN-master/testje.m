clear;

cd C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\Validation\realismCNN\web\ranking\DIH_blender1_bg3;

a = load('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\Validation\realismCNN\web\ranking\DIH_blender1_bg3\scores.mat');
b = load('C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\Validation\realismCNN\web\ranking\DIH_blender1_bg3\scores_har');

c = cat(1,a,b); 

