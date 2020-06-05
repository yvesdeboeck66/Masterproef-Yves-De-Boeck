for k = 0:120
    
path = '!python run_gp_gan.py --src_image images/kitti/source/frame';
path = strcat(path, num2str(k));
path = strcat(path, '.png --dst_image images/kitti/target/frame');
path = strcat(path, num2str(k));
path = strcat(path, '.png --mask_image mask/kitti/frame');
path = strcat(path, num2str(k));
path = strcat(path, '.png --blended_image images/results/kitti/frame');
path = strcat(path, num2str(k));
path = strcat(path, '.png');
disp(path)

end