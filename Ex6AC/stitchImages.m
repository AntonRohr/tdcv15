function [ stitched ] = stitchImages( image1, image2 )
%STITCHIMAGES Summary of this function goes here
%   Detailed explanation goes here

% create Features and match them
[matchedFeat1, matchedFeat2] = createFeatureMatches(image1, image2);

% erase outliers and compute transformation matrix H
[inlierIndices, H] = ransacAdapted(matchedFeat1, matchedFeat2, 2, 4 );

H = maketform('projective', H');



[image1T,xDataImage1T,yDataImage1T]=imtransform(image1,H, 'XYScale', 1);
% now xdataim2t and ydataim2t store the bounds of the transformed im2
xDataOut=[min(1,xDataImage1T(1)) max(size(image2,2),xDataImage1T(2))];
yDataOut=[min(1,yDataImage1T(1)) max(size(image2,1),yDataImage1T(2))];
% let's transform both images with the computed xdata and ydata
image1T=imtransform(image1,H,'XData',xDataOut,'YData',yDataOut, 'XYScale', 1);
image2T=imtransform(image2,maketform('affine',eye(3)),'XData',xDataOut,'YData',yDataOut, 'XYScale', 1);


%stitched = image2T/2 + image1T/2;

stitched = blendImages(image2T, image1T);


end

