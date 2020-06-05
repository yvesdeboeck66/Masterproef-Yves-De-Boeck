clear all;
close all; 


% %kittimix
cd C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\validation\realismCNN\RealismCNN-master
%%redrace
%%%original
% clear all;
% close all;
% exp_name = 'kittimix_redrace_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
%%%DIH
clear all;
close all;
exp_name = 'kittimix_redrace_compVSdih';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\redrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\DIH_output\redrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\validation\realismCNN\web\kittimix_redrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
%%%GP
clear all;
close all;
exp_name = 'kittimix_redrace_compVSgp';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\redrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\GPGAN_output\redrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\validation\realismCNN\web\kittimix_redrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
%rangerover
%%original
% clear all;
% close all;
% exp_name = 'kittimix_rangerover_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
%%%DIH
clear all;
close all;
exp_name = 'kittimix_rangerover_compVSdih';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\rangerover';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\DIH_output\rangerover';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\validation\realismCNN\web\kittimix_rangerover_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
%%%GP
clear all;
close all;
exp_name = 'kittimix_rangerover_compVSgp';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\rangerover';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\GPGAN_output\rangerover';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\validation\realismCNN\web\kittimix_rangerover_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %greenrace
% %original
% clear all;
% close all;
% exp_name = 'kittimix_greenrace_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
clear all;
close all;
exp_name = 'kittimix_greenrace_compVSdih';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\greenrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\DIH_output\greenrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\validation\realismCNN\web\kittimix_greenrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------") 
% %%%GP
clear all;
close all;
exp_name = 'kittimix_greenrace_compVSgp';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\greenrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\GPGAN_output\greenrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\validation\realismCNN\web\kittimix_greenrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")


% % %kitti13
% cd C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\validation\realismCNN\RealismCNN-master
% %%redrace
% %%%original
% % clear all;
% % close all;
% % exp_name = 'kitti13_redrace_compVSori';
% % dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\composites\redrace';
% % dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\original';
% % PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
% clear all;
% close all;
% exp_name = 'kitti13_redrace_compVSdih';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\DIH_output\redrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\validation\realismCNN\web\kitti13_redrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
% clear all;
% close all;
% exp_name = 'kitti13_redrace_compVSgp';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\GPGAN_output\redrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\validation\realismCNN\web\kitti13_redrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %rangerover
% %%original
% % clear all;
% % close all;
% % exp_name = 'kitti13_rangerover_compVSori';
% % dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\composites\rangerover';
% % dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\original';
% % PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
% clear all;
% close all;
% exp_name = 'kitti13_rangerover_compVSdih';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\DIH_output\rangerover';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\validation\realismCNN\web\kitti13_rangerover_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
% clear all;
% close all;
% exp_name = 'kitti13_rangerover_compVSgp';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\GPGAN_output\rangerover';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\validation\realismCNN\web\kitti13_rangerover_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% % %greenrace
% % %original
% % clear all;
% % close all;
% % exp_name = 'kitti13_greenrace_compVSori';
% % dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\composites\greenrace';
% % dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\original';
% % PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% % fprintf("\n------------------------------------------------------------------------------------------------")
% % fprintf("\n------------------------------------------------------------------------------------------------")
% % fprintf("\n------------------------------- batch processed ------------------------------------------------")
% % fprintf("\n------------------------------------------------------------------------------------------------")
% % fprintf("\n------------------------------------------------------------------------------------------------")
% % %%%DIH
% clear all;
% close all;
% exp_name = 'kitti13_greenrace_compVSdih';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\DIH_output\greenrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\validation\realismCNN\web\kitti13_greenrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------") 
% % %%%GP
% clear all;
% close all;
% exp_name = 'kitti13_greenrace_compVSgp';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\GPGAN_output\greenrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\validation\realismCNN\web\kitti13_greenrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% kitti15
cd C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\validation\realismCNN\RealismCNN-master
% redrace
%original
% clear all;
% close all;
% exp_name = 'kitti15_redrace_compVSori2';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------") 
% %%%DIH
% clear all;
% close all;
% exp_name = 'kitti15_redrace_compVSdih';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\DIH_output\redrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\validation\realismCNN\web\kitti15_redrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
% clear all;
% close all;
% exp_name = 'kitti15_redrace_compVSgp';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\GPGAN_output\redrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\validation\realismCNN\web\kitti15_redrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% 
% % greenrace
% % %original
% % clear all;
% % close all;
% % exp_name = 'kitti15_greenrace_compVSori3';
% % dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\composites\greenrace';
% % dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\original';
% % PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% % fprintf("\n------------------------------------------------------------------------------------------------")
% % fprintf("\n------------------------------------------------------------------------------------------------")
% % fprintf("\n------------------------------- batch processed ------------------------------------------------")
% % fprintf("\n------------------------------------------------------------------------------------------------")
% % fprintf("\n------------------------------------------------------------------------------------------------")
% % %%%DIH
% clear all;
% close all;
% exp_name = 'kitti15_greenrace_compVSdih';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\DIH_output\greenrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\validation\realismCNN\web\kitti15_greenrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% % %%%GP
% clear all;
% close all;
% exp_name = 'kitti15_greenrace_compVSgp';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\GPGAN_output\greenrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\validation\realismCNN\web\kitti15_greenrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% rangerover
% %original
% clear all;
% close all;
% exp_name = 'kitti15_rangerover_compVSori2';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
% clear all;
% close all;
% exp_name = 'kitti15_rangerover_compVSdih';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\DIH_output\rangerover';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\validation\realismCNN\web\kitti15_rangerover_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
% clear all;
% close all;
% exp_name = 'kitti15_rangerover_compVSgp';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\GPGAN_output\rangerover';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_15\validation\realismCNN\web\kitti15_rangerover_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% 
% % kitti17
cd C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\validation\realismCNN\RealismCNN-master
% % redrace
% % %original
% clear all;
% close all;
% exp_name = 'kitti17_redrace_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
clear all;
close all;
exp_name = 'kitti17_redrace_compVSdih';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\composites\redrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\DIH_output\redrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\validation\realismCNN\web\kitti17_redrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
clear all;
close all;
exp_name = 'kitti17_redrace_compVSgp';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\composites\redrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\GPGAN_output\redrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\validation\realismCNN\web\kitti17_redrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% % rangerover
% % %original
% clear all;
% close all;
% exp_name = 'kitti17_rangerover_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
clear all;
close all;
exp_name = 'kitti17_rangerover_compVSdih';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\composites\rangerover';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\DIH_output\rangerover';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\validation\realismCNN\web\kitti17_rangerover_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
clear all;
close all;
exp_name = 'kitti17_rangerover_compVSgp';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\composites\rangerover';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\GPGAN_output\rangerover';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\validation\realismCNN\web\kitti17_rangerover_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% % greenrace
% % %original
% clear all;
% close all;
% exp_name = 'kitti17_greenrace_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
clear all;
close all;
exp_name = 'kitti17_greenrace_compVSdih';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\composites\greenrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\DIH_output\greenrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\validation\realismCNN\web\kitti17_greenrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
clear all;
close all;
exp_name = 'kitti17_greenrace_compVSgp';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\composites\greenrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\GPGAN_output\greenrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_17\validation\realismCNN\web\kitti17_greenrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% 
% kitti27
cd C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\validation\realismCNN\RealismCNN-master
% %redrace
% %original
% clear all;
% close all;
% exp_name = 'kitti27_redrace_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
%%DIH
% clear all;
% close all;
% exp_name = 'kitti27_redrace_compVSdih';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\DIH_output\redrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\validation\realismCNN\web\kitti27_redrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
% clear all;
% close all;
% exp_name = 'kitti27_redrace_compVSgp';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\GPGAN_output\redrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\validation\realismCNN\web\kitti27_redrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% rangerover
% original
% clear all;
% close all;
% exp_name = 'kitti27_rangerover_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
% clear all;
% close all;
% exp_name = 'kitti27_rangerover_compVSdih';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\DIH_output\rangerover';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\validation\realismCNN\web\kitti27_rangerover_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
% clear all;
% close all;
% exp_name = 'kitti27_rangerover_compVSgp';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\GPGAN_output\rangerover';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\validation\realismCNN\web\kitti27_rangerover_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% greenrace
%original
% clear all;
% close all;
% exp_name = 'kitti27_greenrace_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
% clear all;
% close all;
% exp_name = 'kitti27_greenrace_compVSdih';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\DIH_output\greenrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\validation\realismCNN\web\kitti27_greenrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
% clear all;
% close all;
% exp_name = 'kitti27_greenrace_compVSgp';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\GPGAN_output\greenrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_27\validation\realismCNN\web\kitti27_greenrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% 
% kitti32
cd C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\validation\realismCNN\RealismCNN-master
% %redrace
% %original
% clear all;
% close all;
% exp_name = 'kitti32_redrace_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
clear all;
close all;
exp_name = 'kitti32_redrace_compVSdih';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\composites\redrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\DIH_output\redrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\validation\realismCNN\web\kitti32_redrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
clear all;
close all;
exp_name = 'kitti32_redrace_compVSgp';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\composites\redrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\GPGAN_output\redrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\validation\realismCNN\web\kitti32_redrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% rangerover
%original
% clear all;
% close all;
% exp_name = 'kitti32_rangerover_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
clear all;
close all;
exp_name = 'kitti32_rangerover_compVSdih';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\composites\rangerover';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\DIH_output\rangerover';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\validation\realismCNN\web\kitti32_rangerover_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
clear all;
close all;
exp_name = 'kitti32_rangerover_compVSgp';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\composites\rangerover';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\GPGAN_output\rangerover';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\validation\realismCNN\web\kitti32_rangerover_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------") 
% greenrace
%original
% clear all;
% close all;
% exp_name = 'kitti32_greenrace_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
clear all;
close all;
exp_name = 'kitti32_greenrace_compVSdih';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\composites\greenrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\DIH_output\greenrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\validation\realismCNN\web\kitti32_greenrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
clear all;
close all;
exp_name = 'kitti32_greenrace_compVSgp';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\composites\greenrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\GPGAN_output\greenrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_32\validation\realismCNN\web\kitti32_greenrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")

% kitti56
cd C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\validation\realismCNN\RealismCNN-master
% %redrace
% %original
% exp_name = 'kitti56_redrace_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
clear all;
close all;
exp_name = 'kitti56_redrace_compVSdih';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\composites\redrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\DIH_output\redrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\validation\realismCNN\web\kitti56_redrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
clear all;
close all;
exp_name = 'kitti56_redrace_compVSgp';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\composites\redrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\GPGAN_output\redrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\validation\realismCNN\web\kitti56_redrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% rangerover
%original
% clear all;
% close all;
% exp_name = 'kitti56_rangerover_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
clear all;
close all;
exp_name = 'kitti56_rangerover_compVSdih';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\composites\rangerover';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\DIH_output\rangerover';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\validation\realismCNN\web\kitti56_rangerover_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------") 
% %%%GP
clear all;
close all;
exp_name = 'kitti56_rangerover_compVSgp';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\composites\rangerover';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\GPGAN_output\rangerover';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\validation\realismCNN\web\kitti56_rangerover_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------") 
% greenrace
%original
% clear all;
% close all;
% exp_name = 'kitti56_greenrace_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------") 
% %%%DIH
clear all;
close all;
exp_name = 'kitti56_greenrace_compVSdih';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\composites\greenrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\DIH_output\greenrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\validation\realismCNN\web\kitti56_greenrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% 
% %%%GP
clear all;
close all;
exp_name = 'kitti56_greenrace_compVSgp';
dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\composites\greenrace';
dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\GPGAN_output\greenrace';
compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_56\validation\realismCNN\web\kitti56_greenrace_compVSori';
PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")

% kitti_mixed
% cd C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\validation\realismCNN\RealismCNN-master
% %redrace
% %original
% exp_name = 'kittimix_redrace_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
% clear all;
% close all;
% exp_name = 'kittimix_redrace_compVSdih';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\DIH_output\redrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\validation\realismCNN\web\kittimix_redrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% %%%GP
% clear all;
% close all;
% exp_name = 'kittimix_redrace_compVSgp';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\redrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\GPGAN_output\redrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\validation\realismCNN\web\kittimix_redrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% rangerover
%original
% clear all;
% close all;
% exp_name = 'kittimix_rangerover_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% %%%DIH
% clear all;
% close all;
% exp_name = 'kittimix_rangerover_compVSdih';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\DIH_output\rangerover';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\validation\realismCNN\web\kittimix_rangerover_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------") 
% %%%GP
% clear all;
% close all;
% exp_name = 'kittimix_rangerover_compVSgp';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\rangerover';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\GPGAN_output\rangerover';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\validation\realismCNN\web\kittimix_rangerover_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------") 
% greenrace
%original
% clear all;
% close all;
% exp_name = 'kittimix_greenrace_compVSori';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\original';
% PredictRealismROC(exp_name,dir_comp,dir_har,1,'');
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------- batch processed ------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------")
% fprintf("\n------------------------------------------------------------------------------------------------") 
% %%%DIH
% clear all;
% close all;
% exp_name = 'kittimix_greenrace_compVSdih';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\DIH_output\greenrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\validation\realismCNN\web\kittimix_greenrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
% 
% %%%GP
% clear all;
% close all;
% exp_name = 'kittimix_greenrace_compVSgp';
% dir_comp = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\composites\greenrace';
% dir_har = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_mix\GPGAN_output\greenrace';
% compscoredir = 'C:\Users\yvesk\Documents\Academiejaar2019-2020\Masterproef\IMAGE_COMPOSITION\blender\kitti\kitti_13\validation\realismCNN\web\kittimix_greenrace_compVSori';
% PredictRealismROC(exp_name,dir_comp,dir_har,0,compscoredir);
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------- batch processed ------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")
fprintf("\n------------------------------------------------------------------------------------------------")