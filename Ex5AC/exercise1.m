
% read image
image = imread('2007_000032.jpg');

integralImage = createIntegralImage(image);

imagesc(integralImage);

% convert lists to matrices
[treeMatrix, leafMatrix] = getTreeMatrix('Tree0.txt');


