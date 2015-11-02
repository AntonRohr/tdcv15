%Initialize the workspace
clear all; clc; close all;

%Read in and plot the input image
input = double(imread('lena.gif'));
figure; 
subplot(2,3,1); imagesc(input); title('Origin Lena');

%Create the input mask
mask = ones(3); 

%test padding function
mirror_padding = pad(input, ones(100), 'mirror');
clamp_padding = pad(input, ones(100), 'clamp');
subplot(2,3,2); imagesc(mirror_padding); title('Mirror Padding Lena');
subplot(2,3,3); imagesc(clamp_padding); title('Clamp Padding Lena');

%Apply the convolution filter
output_clamp = filter2d(input, mask, 'clamp'); 
output_mirror = filter2d(input, mask, 'mirror'); 
%Plot the output
subplot(2,3,5); imagesc(output_clamp); title('Clamp Mean Filter Lena');
subplot(2,3,6); imagesc(output_mirror); title('Mirror Mean Filter Lena');


colormap gray;
