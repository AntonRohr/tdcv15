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

cellSize = 4;
hogScene = vl_hog(sceneImage, cellSize, 'verbose');

% n scale levels
n = 7;



scoreMatrix = zeros(5,n);

%iterate over different scale levels
for i = 1:n

    scaleFactor = 1.1-0.1*i;
    objectImageResized = imresize(objectImage, scaleFactor);
    %size(objectImageResized)

    
    hogObject = vl_hog(objectImageResized, cellSize, 'verbose');
    
    

    scores = vl_nnconv(hogScene, hogObject, [], 'Pad', 0, 'Stride', 1, 'verbose');
    
    %convOutput = hogConvolution(hogScene, hogObject);
    %a = convOutput(1);
    %b = convOutput(2);
    %c = convOutput(3);
    %d = convOutput(4);
    %e = convOutput(1);
    %row = a+b/2
    %col = c+d/2

    %imagesc(scores);
    

    % find maximal score
    %scores = normalize(scores);
    maxScore = max(scores(:));
    scores(scores<maxScore) = 0;
    [row, col] = find(scores);
    
    topLeftRow = row*cellSize;
    topLeftCol = col*cellSize;
    bottomRightRow = topLeftRow + size(objectImageResized, 1);
    bottomRightCol = topLeftCol + size(objectImageResized, 2);

    %normalize maxScore
    
    maxScore = maxScore / (size(objectImageResized,1)*size(objectImageResized,2)) %scaleFactor^2; %(size(scores,1)+size(scores,2));
    
    scoreMatrix(:,i) = [maxScore; topLeftCol; topLeftRow; bottomRightCol; bottomRightRow]

    %row = row.*cellSize;
    %row = row + round(size(objectImageResized, 1)/2)
    %col = col.*cellSize;
    %col = col + round(size(objectImageResized, 2)/2)

    % display result
    %output = drawCorners(output,[row, col]);
    %imagesc(output);

    
    column = scoreMatrix(:,i);

    cornerList = zeros(4,2);
    cornerList(1,:) = [column(2), column(3)]; 
    cornerList(2,:) = [column(2), column(5)]; 
    cornerList(3,:) = [column(4), column(5)]; 
    cornerList(4,:) = [column(4), column(3)]; 

    output = drawBB(output, cornerList, 'red');

end

%output = vl_hog('render', hogObject, 'verbose');

scoreMatrix
[maximum, index] = max(scoreMatrix(1,:));


column = scoreMatrix(:,index);

cornerList = zeros(4,2);
cornerList(1,:) = [column(2), column(3)]; 
cornerList(2,:) = [column(2), column(5)]; 
cornerList(3,:) = [column(4), column(5)]; 
cornerList(4,:) = [column(4), column(3)]; 

output = drawBB(output, cornerList, 'green');


end

