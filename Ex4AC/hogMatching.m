function [ output_args ] = hogMatching( objectImageRGB, sceneImageRGB )
%HOGMATCHING Summary of this function goes here
%   Detailed explanation goes here


%% preprocess

objectImage = im2single(rgb2gray(objectImageRGB));
sceneImage = im2single(rgb2gray(sceneImageRGB));


% create big image
mergedImage = mergeImages(sceneImage, objectImage);
mergedImageRGB = mergeImages(sceneImageRGB, objectImageRGB);

%% main part

cellSize = 8 ;
hog = vl_hog(sceneImage, cellSize, 'verbose') ;

output = vl_hog('render', hog, 'verbose');

imshow(output);

end

