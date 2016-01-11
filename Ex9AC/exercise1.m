inputImg = imread('img_sequence/0000.png');

% getCornerPoints
upperLeft = [76,103] + randi(10);
lowerLeft = [391,106] + randi(10);
upperRight = [76,549] + randi(10);
lowerRight = [384,552] + randi(10);

% warpPositions slightly
upperLeftWarp = upperLeft + randi(10);
lowerLeftWarp = lowerLeft + randi(10);
upperRightWarp = upperRight + randi(10);
lowerRightWarp = lowerRight + randi(10);

pointMatrix = [upperLeft ; lowerLeft; upperRight; lowerRight];
pointMatrixWarp = [upperLeftWarp; lowerLeftWarp; upperRightWarp; lowerRightWarp];

tform = estimateGeometricTransform(pointMatrix,pointMatrixWarp,'projective')
invtform = tform.invert

warpedImg = imwarp(inputImg, tform);

backwarpedImg = imwarp(warpedImg, invtform);


imshowpair(warpedImg, backwarpedImg, 'diff');
