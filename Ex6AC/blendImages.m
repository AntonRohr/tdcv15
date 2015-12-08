function [ outputImage ] = blendImages( image1, image2 )
%BLENDIMAGES Summary of this function goes here
%   Detailed explanation goes here


maskBoth = image2>0 & image1>0;

outputImage = zeros(size(image1), 'uint8');

outputImage(~maskBoth) = image1(~maskBoth) + image2(~maskBoth);
outputImage(maskBoth) = image1(maskBoth)/2 + image2(maskBoth)/2;

end

