%Initialize the workspace
clear all; clc; close all;

%Read in and plot the input image
input = double(imread('lena.gif'));
figure; 
subplot(3,3,1); imagesc(input);

%Create the input mask
mask_2d = gaussianKernel2d(15,5);

mask_1d_h = discreteGaussian(15,5)./discreteGaussian(15,5);
mask_1d_v = mask_1d_h';

%Apply the convolution filter
output_2d = filter2d(input, mask_2d, 'replicate');
output_1d_h = filter2d(input, mask_1d_h, 'replicate');
output_1d_v = filter2d(input, mask_1d_v, 'replicate');

output_h_v = filter2d(output_1d_h, mask_1d_v, 'replicate');

%Plot the output
subplot(3,3,2); imagesc(output_2d);
subplot(3,3,3); imagesc((output_2d-input).^2);

subplot(3,3,5); imagesc(output_1d_h);
subplot(3,3,6); imagesc(output_1d_v);

subplot(3,3,8); imagesc(output_h_v);
subplot(3,3,9); imagesc((output_2d - output_h_v).^2);
colormap gray;
