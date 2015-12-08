function [ matchedFeat1, matchedFeat2 ] = createFeatureMatches( grayImage1, grayImage2 )
%CREATEFEATUREMATCHES Summary of this function goes here
%   Detailed explanation goes here

% preprocess
image1 = im2single(grayImage1);
image2 = im2single(grayImage2);

% find matches with SIFT
% compute sift features and descriptors 
[feat1, desc1] = vl_sift(image1);
[feat2, desc2] = vl_sift(image2);

% match features (via using decriptors)
matchThreshold = 1.4;
[matches, scores] = vl_ubcmatch(desc1, desc2, matchThreshold); 

% filter out matched features (without orientation/scale)
matchedFeat1 = feat1(1:2,matches(1,:));
matchedFeat2 = feat2(1:2,matches(2,:));

end

