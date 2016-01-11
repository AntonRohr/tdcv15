inputImg = imread('seq/im000.pgm');


winSize = 100;

% getCornerPoints [col, row]
upperLeft = [170,210];
lowerLeft = [upperLeft(1) ,upperLeft(2)+winSize];
upperRight = [upperLeft(1)+winSize ,upperLeft(2)];
lowerRight = [upperLeft(1)+winSize ,upperLeft(2)+winSize];

gridPoints = createRectPatch(inputImg, upperLeft, winSize);

backWarpedGridPoints = createWarpedPatch(inputImg, upperLeft, gridPoints, winSize, 10);


