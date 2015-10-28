%read image and convert to double type. 
inputImage = im2double(imread('lena.gif'));

aDx = [-1,0,1;-1,0,1;-1,0,1];
aDy = [-1,-1,-1;0,0,0;1,1,1];

% choose type
type = 'mirror';
% convolute the input image with Dx and Dy, store in to seperate images
InConvDx = convFilter(inputImage, Dx, type);
InConvDy = convFilter(inputImage, Dy, type);

% execute formula from exercise sheet to compute the gradient magnitude
% image
bGrad = sqrt(InConvDx.^2+InConvDy.^2);

% execute formula from exercise sheet to compute the orientations image
bOrient = atan2(InConvDx, InConvDy);

