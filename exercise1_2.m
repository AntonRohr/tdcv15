%Initialize the workspace
clear all; clc; close all;

%Read in and plot the input image
input = double(imread('lena.gif'));
figure; 
subplot(1,3,1); imagesc(input);

%Create the input mask
mask = gaussianKernel2d(15,5);

%Apply the convolution filter
output = filter2d(input, mask, 'replicate');

%Plot the output
subplot(1,3,2); imagesc(output);
subplot(1,3,3); imagesc((output-input).^2);
colormap gray;
