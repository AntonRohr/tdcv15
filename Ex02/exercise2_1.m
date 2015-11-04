%Initialize the workspace
clear all; clc; close all;

%Read in the input image
input_image = imread('lena.gif');

%Perform gaussian filtering
mask_gaussian = gaussianKernel2d(3);
output_gaussian = filter2d(input_image, mask_gaussian, 'clamp');

%Perform median filtering
output_median = medianFilter(input_image, 3);

%Add salt and pepper noise
%reference matlab function:
%noisy_s_p = imnoise(input, 'salt & pepper');
noisy_s_p = saltPepperNoise(input_image, 0.05);


%Add gaussian noise
%reference matlab function:
%noisy_gaussian = imnoise(input_image, 'gaussian');
noisy_gaussian = gaussianNoise(input_image, 10);

%Apply and cross-apply filters
median_s_p = medianFilter(noisy_s_p, 3);
median_gaussian = medianFilter(noisy_gaussian, 3);
gaussian_s_p = filter2d(noisy_s_p, mask_gaussian, 'clamp');
gaussian_gaussian = filter2d(noisy_gaussian, mask_gaussian, 'clamp');

%Display output
figure; 
subplot(3,3,1); imagesc(input_image); title('Original Lena');
subplot(3,3,2); imagesc(output_median); title('Median filtered');
subplot(3,3,3); imagesc(output_gaussian); title('Gaussian filtered');

subplot(3,3,4); imagesc(noisy_s_p); title('Salt & Pepper Noise');
subplot(3,3,5); imagesc(median_s_p);
subplot(3,3,6); imagesc(gaussian_s_p);
subplot(3,3,7); imagesc(noisy_gaussian); title('Gaussian Noise');
subplot(3,3,8); imagesc(median_gaussian);
subplot(3,3,9); imagesc(gaussian_gaussian);


colormap gray;