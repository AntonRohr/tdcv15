function [ backWarpedGridPoints ] = createWarpedPatch(inputImg, upperLeft, gridPoints, winSize, randVal)
%CREATEWARPEDPATCH Summary of this function goes here
%   Detailed explanation goes here

lowerLeft = [upperLeft(1) ,upperLeft(2)+winSize];
upperRight = [upperLeft(1)+winSize ,upperLeft(2)];
lowerRight = [upperLeft(1)+winSize ,upperLeft(2)+winSize];


% warpPositions slightly
upperLeftWarp = [upperLeft(1) + randi(randVal), upperLeft(2) + randi(randVal)];
lowerLeftWarp = [lowerLeft(1) + randi(randVal), lowerLeft(2) + randi(randVal)];
upperRightWarp = [upperRight(1) + randi(randVal), upperRight(2) + randi(randVal)];
lowerRightWarp = [lowerRight(1) + randi(randVal), lowerRight(2) + randi(randVal)];


pointMatrix = [upperLeft ; lowerLeft; upperRight; lowerRight];
pointMatrixWarp = [upperLeftWarp; lowerLeftWarp; upperRightWarp; lowerRightWarp];

tform = estimateGeometricTransform(pointMatrix,pointMatrixWarp,'projective');

%warp gridPoints
warpedGridPoints = zeros(size(gridPoints));
warpedGridPoints(:,1:2) = transformPointsForward(tform, gridPoints(:,1:2));

%rounding.. not sure if necessary
warpedGridPoints = round(warpedGridPoints);


backWarpedGridPoints = zeros(size(gridPoints));
backWarpedGridPoints(:,1:2) = transformPointsInverse(tform, warpedGridPoints(:,1:2));

backWarpedGridPoints = round(backWarpedGridPoints);

for i = 1:size(warpedGridPoints,1)
    row = backWarpedGridPoints(i,2);
    col = backWarpedGridPoints(i,1);
    warpedGridPoints(i,3) = inputImg(row, col);
    backWarpedGridPoints(i,3) = inputImg(row, col);
end



end

