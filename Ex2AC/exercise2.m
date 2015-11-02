% Read image
image = im2double(imread('lena.gif'));

sigma = 1;

tic;
outputImage = bilateralFilter(image, sigma);
toc;
 
tic;
outputImage2 = bilateralFilter2(image, sigma);
toc;

%imshowpair(outputImage, outputImage2, 'diff');
%imshow(outputImage2);
%outputImage-outputImage2
%sum(sum((outputImage-outputImage2)^2))

%imshowpair(outputImage, outputImage2, 'diff');