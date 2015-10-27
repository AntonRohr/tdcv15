function [gradientImage, orientationsImage] = gradOrient( inputImage, type )

% filtering mask from exercise sheet
Dx = [-1,0,1;-1,0,1;-1,0,1];
Dy = [-1,-1,-1;0,0,0;1,1,1];

% convolute the input image with Dx and Dy, store in to seperate images
InConvDx = convFilter(inputImage, Dx, type);
InConvDy = convFilter(inputImage, Dy, type);

% execute formula from exercise sheet to compute the gradient magnitude
% image
gradientImage = sqrt(InConvDx.^2+InConvDy.^2);

% execute formula from exercise sheet to compute the orientations image
orientationsImage = atan2(InConvDx, InConvDy);

end

