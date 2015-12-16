%Initialise the vl library.
%run('C:\Users\Anton Troynikov\Documents\MATLAB\vlfeat-0.9.20-bin\vlfeat-0.9.20\toolbox\vl_setup.m')

%Read the first image
i_0 = imread('img_sequence/0000.png');

%Initialise intrinsics
A = [472.3 0.64 329.0; 0 471.0 268.3; 0 0 1];

%Get the SIFT points 
[f_0,d_0] = vl_sift(single(rgb2gray((i_0))));

%Trim the SIFT points to just those within the object
%Points found via imcrop.
x_min = 103.51;
x_max = x_min + 447.98;
y_min = 74.51;
y_max = y_min + 310.98;

accumulator = zeros(4,1);
for i=1:size(f_0 , 2)
    element = f_0(:,i);
    if(element(1) < x_max && element(1) > x_min && element(2) < y_max && element(2) > y_min)
        accumulator = cat(2, accumulator, element);
    end
end
f_0 = accumulator(:,2:end);

%Transform features into homogeneous coordinates 
h_f0 = [f_0(1:2,:);zeros(1,size(f_0,2))];

%Reproject the points into the image plane
M_0 = inv(A)*h_f0;