%Initialize the workspace
clear all; clc; close all;

%Read in and plot the input image
input = double(imread('lena.gif'));
figure; subplot(1,2,1); imagesc(input);

%Create the input mask
mask = ones(3,3);

%Apply the convolution filter
output = filter2d(input, mask, 'symmetric');

%Plot the output
subplot(1,2,2); imagesc(output); colormap gray;
