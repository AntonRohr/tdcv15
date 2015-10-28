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

sigma = 1;

tmp = convFilter(inputImage, gaussian2dMask(3*sigma, 3*sigma, sigma), type);
Ix1 = convFilter(tmp, Dx, type);

Iy1 = convFilter(tmp, Dy, type);

%same as above, only with the smoothed images
gradientSmoothed1 = sqrt(Ix1.^2+Iy1.^2);

orientationsSmoothed1 = atan2(Ix1, Iy1);


tmp = convFilter(gaussian2dMask(3*sigma, 3*sigma, sigma), Dx, type);
Ix2 = convFilter(inputImage, tmp, type);

tmp = convFilter(gaussian2dMask(3*sigma, 3*sigma, sigma), Dy, type);
Iy2 = convFilter(inputImage, tmp, type);

%same as above, only with the smoothed images
gradientSmoothed2 = sqrt(Ix2.^2+Iy2.^2);

orientationsSmoothed2 = atan2(Ix2, Iy2);


subplot(2,4,1);
imshow(InConvDx);
title('Dx');

subplot(2,4,2);
imshow(InConvDy);
title('Dy');

subplot(2,4,3);
imshow(gradient);
title('Gradient Magnitudes');

subplot(2,4,4);
imshow(orientations);
title('Orientations');

%subplot(3,4,5);
%imshow(Ix);
%title('Dx - smoothed');

%subplot(3,4,6);
%imshow(Iy);
%title('Dy - smoothed');

subplot(2,4,5);
imshow(gradientSmoothed1);
title('Gradient Magnitudes - smoothed 1');

subplot(2,4,6);
imshow(orientationsSmoothed1);
title('Orientations - smoothed 1');

subplot(2,4,7);
imshow(gradientSmoothed2);
title('Gradient Magnitudes - smoothed 2');

subplot(2,4,8);
imshow(orientationsSmoothed2);
title('Orientations - smoothed 2');



