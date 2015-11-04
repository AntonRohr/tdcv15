%% read image
image = im2double(imread('lena.gif'));
%output = medianFilter(image, 2, 21);

%% generate noise
% Create image with salt-pepper-noise
salted = generateNoise(image, 'salt', 5000);
% Create Image with white gaussian noise
gaussed = generateNoise(image, 'gaussian', 25);

%% specify sigma for GaussFilter
sigma = 3;


%% Filter the gaussed image with median and gauss filter
outputGaussMFilter = medianFilter(gaussed, 3,3);
outputGaussGFilter = convFilter(gaussed,gaussian2dMask(3*sigma, 3*sigma, sigma),'mirror');

%imshowpair(gaussed, image, 'diff');
%imshowpair(image,output, 'diff');

%% Filter the salted image with median and gauss filter
outputSaltMFilter = medianFilter(salted, 3,3);
outputSaltGFilter = convFilter(salted, gaussian2dMask(3*sigma, 3*sigma, sigma),'mirror');

%% Show output
subplot(2,4,1);
imshow(image);
title('original image');

subplot(2,4,2);
imshow(salted);
title('Salt-and-pepper noise');

subplot(2,4,3);
imshow(outputSaltMFilter);
title('Salted image with median filter');

subplot(2,4,4);
imshow(outputSaltGFilter);
title('Salted image with gaussian filter');

subplot(2,4,6);
imshow(gaussed);
title('Gaussian Noise');

subplot(2,4,7);
imshow(outputGaussMFilter);
title('Gaussian noise with median filter');

subplot(2,4,8);
imshow(outputGaussGFilter);
title('Gaussian noise convoluted with gaussian filter');




