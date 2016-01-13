inputImg = imread('seq/im000.pgm');


winSize = 100;

% getCornerPoints [col, row]
upperLeft = [170,210];
%lowerLeft = [upperLeft(1) ,upperLeft(2)+winSize];
%upperRight = [upperLeft(1)+winSize ,upperLeft(2)];
%lowerRight = [upperLeft(1)+winSize ,upperLeft(2)+winSize];
% cornerPoints denoted as mu_r (greek mu - r = reference)
mu_r = [ upperLeft(1); upperLeft(2); upperLeft(1); upperLeft(2)+winSize; upperLeft(1)+winSize; upperLeft(2); upperLeft(1)+winSize; upperLeft(2)+winSize];

% create Patch
gridPoints = createRectPatch(upperLeft, winSize);

numOfGridPoints = size(gridPoints,1);

originalIntensities = zeros(size(gridPoints, 1),1);
for i = 1:size(originalIntensities,1)
    col = gridPoints(i,2);
    row = gridPoints(i,1);
    originalIntensities(i) = inputImg(row,col);
end

originalNormalizedIntensities = normalize(originalIntensities);

% numWarpedSamples needs to be >= numOfGridPoints
numWarpedSamples = numOfGridPoints+100;

% this is n in A_n
numOfUpdateMatrices = 10;
% size of the displacement between two updateMatrices
updateMatrixDisplacementStep = 3;
% minimal displacement 
%updateMatrixStartValue = 3;

% A = series of update Matrices
% A_0 = small displacement
% A_n = large displacement
A = zeros(8,numOfGridPoints,numOfUpdateMatrices);

for i = 1:numOfUpdateMatrices
    
    I = zeros(numOfGridPoints,numWarpedSamples);
    P = zeros(8, numWarpedSamples);
    
    for j = 1:numOfGridPoints
        
        [cornerDisplacements, warpedIntensities] = createWarpedIntensities(inputImg, mu_r, gridPoints(:,1:2), i*updateMatrixDisplacementStep);
        warpedNormalizedIntensities = normalize(warpedIntensities);
        %[warpedPoints, cornerDisplacements] = createWarpedPatch(inputImg, upperLeft, gridPoints, winSize, i*updateMatrixDisplacementStep);
        %warpedNormalizedIntensities = normalize(warpedPoints(:,3));
        
        %add noise
        warpedNormalizedIntensities = awgn(warpedNormalizedIntensities,20);
        
        I(:,j) = originalNormalizedIntensities - warpedNormalizedIntensities;
        %I(:,j) = normalize(originalNormalizedIntensities - warpedNormalizedIntensities);
        %I(:,j) = normalize(originalIntensities - warpedIntensities);
        P(:,j) = cornerDisplacements;
    end
    
    i
    A(:,:,i) = P*I'*inv(I*I');
end









%backWarpedGridPoints = createWarpedPatch(inputImg, upperLeft, gridPoints, winSize, 10);




