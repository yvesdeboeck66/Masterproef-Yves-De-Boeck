R_RECT_00 =  [9.999239e-01	9.837760e-03	-7.445048e-03	0;
             -9.869795e-03	9.999421e-01	-4.278459e-03	0;
              7.402527e-03	4.351614e-03	9.999631e-01	0;
              0	            0	            0	            1];


P_RECT_02 = [7.215377e+02	0.000000e+00	6.095593e+02	4.485728e+01;
             0.000000e+00	7.215377e+02	1.728540e+02	2.163791e-01;
             0.000000e+00	0.000000e+00	1.000000e+00	2.745884e-03];
         
RT_velo2cam = [7.533745e-03	-9.999714e-01	-6.166020e-04	-4.069766e-03;
               1.480249e-02	7.280733e-04	-9.998902e-01	-7.631618e-02;
               9.998621e-01	7.523790e-03	1.480755e-02	-2.717806e-01;
               0	        0	            0	             1];
           

X4 = [14.741376329501735;
      3.1848622403655611;
     -1.6882317066192627;
      1];
Y4 = P_RECT_02 * R_RECT_00 * RT_velo2cam * X4 


X5 = [11.900468366938719;
      3.1855070735335591;
     -1.7242273651063442;
      1];
Y5 = P_RECT_02 * R_RECT_00 * RT_velo2cam * X5 


X7 = [6.5827295265577277;
      3.1436498308831715;
     -1.7541400417685509;
      1];
Y7 = P_RECT_02 * R_RECT_00 * RT_velo2cam * X7 

 
tracklet_to_label()