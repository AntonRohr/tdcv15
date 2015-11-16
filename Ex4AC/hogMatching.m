function [ output ] = hogMatching( objectImageRGB, sceneImageRGB )
%HOGMATCHING Summary of this function goes here
%   Detailed explanation goes here


%% preprocess

objectImage = im2single(rgb2gray(objectImageRGB));
sceneImage = im2single(rgb2gray(sceneImageRGB));


% create big image
mergedImage = mergeImages(sceneImage, objectImage);
mergedImageRGB = mergeImages(sceneImageRGB, objectImageRGB);

%% main part

output = sceneImageRGB;

% n scale levels
n = 9;
%iterate over different scale levels
for i = 1:n

    objectImage = imresize(objectImage, 0.9);
    size(objectImage)

    cellSize = 32 ;
    hogObject = vl_hog(objectImage, cellSize, 'verbose');
    hogScene = vl_hog(sceneImage, cellSize, 'verbose');

    scores = vl_nnconv(hogScene, hogObject, []);


    % find minimal score
    scores(scores>min(scores(:))) = 0;
    [row, col] = find(scores);
    row = row.*cellSize;
    row = row + round(size(objectImage, 1)/2);
    col = col.*cellSize;
    col = col + round(size(objectImage, 2)/2);

    % display result
    output = drawCorners(output,[row, col]);

end

%output = vl_hog('render', hogObject, 'verbose');



end

