%Initialize the workspace
clear all; clc; close all;

%Read in and plot the input image
input = double(imread('lena.gif'));
figure; 
subplot(2,3,1); imagesc(input); title('Origin Lena');

%Create the input masks for the gradients
mask_dx = repmat([-1,0,1],3,1);
mask_dy = repmat([-1,0,1]',1,3); 

%Apply the differential filter
output_dx = filter2d(input, mask_dx, 'clamp');
output_dy = filter2d(input, mask_dy, 'clamp');

subplot(2,3,2); imagesc(output_dx); title('Dx Lena');
subplot(2,3,3); imagesc(output_dy); title('Dy Lena');

%Calculate magnitudes and directions
output_magnitude = sqrt(output_dx.^2 + output_dy.^2);
output_direction = atan2(output_dy,output_dx);

subplot(2,3,5); imagesc(output_magnitude); title('Magnitude Lena');
subplot(2,3,6); imagesc(output_direction); title('Direction Lena');

colormap gray;

%Create a gaussian mask and convolve it with the differential filters
mask_gaussian = gaussianKernel2d(5);

mask_smoothed_dx = filter2d(mask_gaussian, mask_dx, 'clamp');
mask_smoothed_dy = filter2d(mask_gaussian, mask_dy, 'clamp');

%Apply the masks to the image
output_smoothed_dx = filter2d(input, mask_smoothed_dx, 'clamp');
output_smoothed_dy = filter2d(input, mask_smoothed_dy, 'clamp');

figure;

subplot(2,3,1); imagesc(input); title('Origin Lena');
subplot(2,3,2); imagesc(output_smoothed_dx); title('Smoothed Dx Lena');
subplot(2,3,3); imagesc(output_smoothed_dy); title('Smoothed Dy Lena');

%Calculate magnitudes and directions for the smoothed case
output_smoothed_magnitude = sqrt(output_smoothed_dx.^2 + output_smoothed_dy.^2);
output_smoothed_direction = atan2(output_smoothed_dy,output_smoothed_dx);

subplot(2,3,5); imagesc(output_smoothed_magnitude);title('Smoothed Magnitude Lena');
subplot(2,3,6); imagesc(output_smoothed_direction);title('Smoothed Direction Lena');

colormap gray;

figure;
subplot(1,3,1); imagesc(input); title('Origin Lena');
output_Ix_1 = filter2d(filter2d(input,mask_gaussian,'clamp'),mask_dx,'clamp');
output_Ix_2 = filter2d(input,filter2d(mask_gaussian,mask_dx,'clamp'),'clamp');

subplot(1,3,2); imagesc(output_Ix_1); title('D_x*(G*I)');
subplot(1,3,3); imagesc(output_Ix_2); title('(D_x*G)*I');

colormap gray;