% read in the images
boxImageGray = imread('box.pgm');
sceneImageGray = imread('scene.pgm');

% create Features and match them
[matchedFeatBox, matchedFeatSc] = createFeatureMatches(boxImageGray, sceneImageGray);



% parameters
N = 40;
t = 2;
k = 4;
T = 0.7 * size(matches,2); 

[inlierIndices, H] = ransacManual(matchedFeatBox, matchedFeatSc, T, t, k, N );

%size(inlierIndices,2)
%H

[inlierIndices, H] = ransacAdapted(matchedFeatBox, matchedFeatSc, t, k );

%size(inlierIndices,2)
%H


