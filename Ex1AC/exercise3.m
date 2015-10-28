%read image and convert to double type. 
inputImage = im2double(imread('lena.gif'));

Dx = [-1,0,1;-1,0,1;-1,0,1];
Dy = [-1,-1,-1;0,0,0;1,1,1];

% choose type
type = 'mirror';
%--- part a)
% convolute the input image with Dx and Dy, store in to seperate images
InConvDx = convFilter(inputImage, Dx, type);
InConvDy = convFilter(inputImage, Dy, type);

%--- part b)
% execute formula from exercise sheet to compute the gradient magnitude
% image
gradient = sqrt(InConvDx.^2+InConvDy.^2);

% execute formula from exercise sheet to compute the orientations image
orientations = atan2(InConvDx, InConvDy);


%--- part c)

sigma = 3;

tmp = convFilter(gaussian2dMask(3*sigma, 3*sigma, sigma), Dx, type);
Ix = convFilter(inputImage, tmp, type);

tmp = convFilter(gaussian2dMask(3*sigma, 3*sigma, sigma), Dy, type);
Iy = convFilter(inputImage, tmp, type);

%same as above, only with the smoothed images
gradientSmoothed = sqrt(Ix.^2+Iy.^2);

orientationsSmoothed = atan2(Ix, Iy);


subplot(3,4,1);
imshow(InConvDx);
title('Dx');

subplot(3,4,2);
imshow(InConvDy);
title('Dy');

subplot(3,4,3);
imshow(gradient);
title('Gradient Magnitudes');

subplot(3,4,4);
imshow(orientations);
title('Orientations');

subplot(3,4,5);
imshow(Ix);
title('Dx - smoothed');

subplot(3,4,6);
imshow(Iy);
title('Dy - smoothed');

subplot(3,4,7);
imshow(gradientSmoothed);
title('Gradient Magnitudes - smoothed');

subplot(3,4,8);
imshow(orientationsSmoothed);
title('Orientations - smoothed');

subplot(3,4,11);
imshowpair(gradient, gradientSmoothed, 'diff');
title('gradient diff smoothed gradient');

subplot(3,4,12);
imshowpair(orientations, orientationsSmoothed, 'diff');
title('orientations diff smoothed orientations'); 


