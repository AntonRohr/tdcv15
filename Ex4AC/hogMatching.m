function [ output ] = hogMatching( objectImageRGB, sceneImageRGB )
%HOGMATCHING Summary of this function goes here
%   Detailed explanation goes here


%% preprocess

objectImage = im2single(rgb2gray(objectImageRGB));
sceneImage = im2single(rgb2gray(sceneImageRGB));


% create big image
%mergedImage = mergeImages(sceneImage, objectImage);
%mergedImageRGB = mergeImages(sceneImageRGB, objectImageRGB);

%% main part

output = sceneImageRGB;

cellSize = 16;
hogScene = vl_hog(sceneImage, cellSize, 'verbose');

% n scale levels
n = 5;
%iterate over different scale levels
for i = 1:n

    objectImageResized = imresize(objectImage, 1/i); %1.5-0.1*i);
    %size(objectImageResized)

    
    hogObject = vl_hog(objectImageResized, cellSize, 'verbose');
    
    scores = vl_nnconv(hogScene, hogObject, [], 'Pad', 0);

    %convOutput = hogConvolution(hogScene, hogObject);
    %a = convOutput(1);
    %b = convOutput(2);
    %c = convOutput(3);
    %d = convOutput(4);
    %e = convOutput(1);
    %row = a+b/2
    %col = c+d/2

    imagesc(scores);

    % find maximal score
    scores(scores<max(scores(:))) = 0;
    [row, col] = find(scores)
    row = row.*cellSize;
    row = row + round(size(objectImageResized, 1)/2);
    col = col.*cellSize;
    col = col + round(size(objectImageResized, 2)/2);

    % display result
    output = drawCorners(output,[row, col]);
    imagesc(output);
end

%output = vl_hog('render', hogObject, 'verbose');



end

