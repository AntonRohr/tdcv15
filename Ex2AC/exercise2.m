%% Read image
image = im2double(imread('lena.gif'));

%% bilateral filter
% bilateral Filter with sigma = 1
tic;
bilSigma1 = bilateralFilter(image, 1, 0.1);
bilsigma1time = toc
 
% bilateral Filter with sigma = 5
tic;
bilSigma5 = bilateralFilter(image, 5, 0.1);
bilsigma5time = toc

% bilateral Filter with sigma = 10
tic;
bilSigma10 = bilateralFilter(image, 10, 0.1);
bilsigma10time = toc

%% gaussian filter
% gaussian Filter with sigma = 1
tic;
sigma = 1;
gauSigma1 = convFilter(image, gaussian2dMask(3*sigma, 3*sigma, sigma),'mirror');
gauSigma1time = toc

% gaussian Filter with sigma = 5
tic;
sigma = 5;
gauSigma5 = convFilter(image, gaussian2dMask(3*sigma, 3*sigma, sigma),'mirror');
gauSigma5time = toc

% gaussian Filter with sigma = 5
tic;
sigma = 10;
gauSigma10 = convFilter(image, gaussian2dMask(3*sigma, 3*sigma, sigma),'mirror');
gauSigma10time = toc


%% Show output
subplot(2,4,1);
imshow(image);
title('original image');

subplot(2,4,2);
imshow(bilSigma1);
title('bilateral filter sigma = 1');

subplot(2,4,3);
imshow(bilSigma5);
title('bilateral filter sigma = 5');

subplot(2,4,4);
imshow(bilSigma10);
title('bilateral filter sigma = 10');

subplot(2,4,6);
imshow(gauSigma1);
title('gaussian filter sigma = 1');

subplot(2,4,7);
imshow(gauSigma5);
title('gaussian filter sigma = 5');

subplot(2,4,8);
imshow(gauSigma10);
title('gaussian filter sigma = 10');