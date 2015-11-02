% Read image
image = im2double(imread('lena.gif'));

sigma = 3;

% create mask
outputImage = bilateralFilter(image, sigma);


imshow(outputImage);