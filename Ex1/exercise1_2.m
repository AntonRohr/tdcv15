%Initialize the workspace
clear all; clc; close all;

%Read in and plot the input image
input = double(imread('lena.gif'));
figure; 
subplot(3,3,1); imagesc(input); title('Original Lena')

%Create the input mask
mask_2d = gaussianKernel2d(5);

mask_1d_h = discreteGaussian(5);
mask_1d_v = mask_1d_h';

%Apply the convolution filter
tic;output_2d = filter2d(input, mask_2d, 'clamp');toc;
tic;output_1d_h = filter2d(input, mask_1d_h, 'clamp');
output_1d_v = filter2d(input, mask_1d_v, 'clamp');

output_h_v = filter2d(output_1d_h, mask_1d_v, 'clamp');toc;

%Plot the output
subplot(3,3,2); imagesc(output_2d); title('Gaussian2D Lena');
subplot(3,3,3); imagesc((output_2d-input).^2); title('Differences Ori and 2D')

subplot(3,3,5); imagesc(output_1d_h); title('Gaussian1D\_h Lena');
subplot(3,3,6); imagesc(output_1d_v); title('Gaussian1D\_v Lena');

subplot(3,3,8); imagesc(output_h_v); title('Gaussian1D\_h\_v Lena');
subplot(3,3,9); imagesc((output_2d - output_h_v).^2); title('Differences 2D and 1D1D');
colormap gray;
