function [  ] = siftMatching( objectImageRGB, sceneImageRGB )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%% configuration

matchThreshold = 1.4; %default 1.5


%% preprocess

objectImage = im2single(rgb2gray(objectImageRGB));
sceneImage = im2single(rgb2gray(sceneImageRGB));


% create big image
mergedImage = mergeImages(sceneImage, objectImage);
mergedImageRGB = mergeImages(sceneImageRGB, objectImageRGB);

%% main part


% compute sift features and descriptors 
[featOb, descOb] = vl_sift(objectImage);
[featSc, descSc] = vl_sift(sceneImage);

% adapt x values of object features to fit in new mergedImage
featOb(1,:) = featOb(1,:)+size(sceneImage,2);

% match features (via using decriptors)
[matches, scores] = vl_ubcmatch(descOb, descSc, matchThreshold); 


% thresholding (filtering) over score
%matches = matches(:,scores > 10000);
%scores = scores(:,scores > 10000);


% filter out matched features
matchedFeatOb = featOb(:,matches(1,:));
matchedFeatSc = featSc(:,matches(2,:));

% delete outliers version 1
%[newf, newfb] = deleteOutliers(newf, newfb);

% delete outliers version 2
[tform,inlyingFeatOb,inlyingFeatSc] = estimateGeometricTransform(matchedFeatOb(1:2,:)',matchedFeatSc(1:2,:)','affine');


% draw inliers
mergedImageRGB = drawLines(mergedImageRGB, [inlyingFeatOb inlyingFeatSc], 'blue');


% create bounding box (bb)
% all [col, row]
bbTopLeft = [size(sceneImage, 2)+1, 1];
bbTopRight = [size(mergedImage, 2), 1];
bbBottomRight = [size(mergedImage,2), size(objectImage,1)];
bbBottomLeft = [size(sceneImage, 2)+1, size(objectImage, 1)];

bbCorners = [bbTopLeft; bbTopRight; bbBottomRight; bbBottomLeft];

% draw bb
mergedImageRGB = drawBB(mergedImageRGB, bbCorners, 'red');

% transform points to other image
bbCornersTransformed = transformPointsForward(tform,bbCorners);

%draw transformed bb
mergedImageRGB = drawBB(mergedImageRGB, bbCornersTransformed, 'red');

% display result
imshow(mergedImageRGB);

% draw sift features with scale and orientation
hb = vl_plotframe(matchedFeatSc) ;
set(hb,'color','y','linewidth',2) ;

h = vl_plotframe(matchedFeatOb);
set(h, 'color', 'r', 'linewidth', 2);



end

