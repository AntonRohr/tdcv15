function [ backWarpedGridPoints, cornerDisplacements ] = createWarpedPatch(inputImg, upperLeft, gridPoints, winSize, randDisp)
%CREATEWARPEDPATCH Summary of this function goes here
%   Detailed explanation goes here

lowerLeft = [upperLeft(1) ,upperLeft(2)+winSize];
upperRight = [upperLeft(1)+winSize ,upperLeft(2)];
lowerRight = [upperLeft(1)+winSize ,upperLeft(2)+winSize];

cornerDisplacements = zeros(8,1);
for i = 1:8
    cornerDisplacements(i) = randi(2*randDisp)-randDisp;
end

% warpPositions slightly
upperLeftWarp = [upperLeft(1) + cornerDisplacements(1), upperLeft(2) + cornerDisplacements(2)];
lowerLeftWarp = [lowerLeft(1) + cornerDisplacements(3), lowerLeft(2) + cornerDisplacements(4)];
upperRightWarp = [upperRight(1) + cornerDisplacements(5), upperRight(2) + cornerDisplacements(6)];
lowerRightWarp = [lowerRight(1) + cornerDisplacements(7), lowerRight(2) + cornerDisplacements(8)];


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

