function [ outputImageRGB ] = drawMatches( image1Gray, image2Gray, features1, features2 )
%DRAWMATCHES Summary of this function goes here
%   Detailed explanation goes here

mergedImage = mergeImages(image1Gray, image2Gray);

features2(1,:) = features2(1,:)+size(image1Gray,2);

outputImageRGB = drawLines(mergedImage, [features1' features2'], 'blue');

end

