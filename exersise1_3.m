%Initialize the workspace
clear all; clc; close all;

%Read in and plot the input image
input = double(imread('lena.gif'));
figure; 
subplot(2,3,1); imagesc(input);

%Create the input masks for the gradients
mask_dx = repmat([-1,0,1],3,1);
mask_dy = repmat([-1,0,1]',1,3); 

%Apply the differential filter
output_dx = filter2d(input, mask_dx, 'replicate');
output_dy = filter2d(input, mask_dy, 'replicate');

subplot(2,3,2); imagesc(output_dx);
subplot(2,3,3); imagesc(output_dy);

%Calculate magnitudes and directions
output_magnitude = sqrt(output_dx.^2 + output_dy.^2);
output_direction = atan2(output_dy,output_dx);

subplot(2,3,5); imagesc(output_magnitude);
subplot(2,3,6); imagesc(output_direction);

colormap gray;

%Create a gaussian mask and convolve it with the differential filters
mask_gaussian = gaussianKernel2d(15,5);

mask_smoothed_dx = filter2d(mask_gaussian, mask_dx, 'replicate');
mask_smoothed_dy = filter2d(mask_gaussian, mask_dy, 'replicate');

%Apply the masks to the image
output_smoothed_dx = filter2d(input, mask_smoothed_dx, 'replicate');
output_smoothed_dy = filter2d(input, mask_smoothed_dy, 'replicate');

figure;

subplot(2,3,1); imagesc(input);
subplot(2,3,2); imagesc(output_smoothed_dx);
subplot(2,3,3); imagesc(output_smoothed_dy);

%Calculate magnitudes and directions for the smoothed case
output_smoothed_magnitude = sqrt(output_smoothed_dx.^2 + output_smoothed_dy.^2);
output_smoothed_direction = atan2(output_smoothed_dy,output_smoothed_dx);

subplot(2,3,5); imagesc(output_smoothed_magnitude);
subplot(2,3,6); imagesc(output_smoothed_direction);

colormap gray;
