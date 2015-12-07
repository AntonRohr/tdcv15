% read in the images
boxImageGray = imread('box.pgm');
sceneImageGray = imread('scene.pgm');

% preprocess
boxImage = im2single(boxImageGray);
sceneImage = im2single(sceneImageGray);

% find matches with SIFT
% compute sift features and descriptors 
[featOb, descOb] = vl_sift(boxImage);
[featSc, descSc] = vl_sift(sceneImage);

% match features (via using decriptors)
matchThreshold = 1.4;
[matches, scores] = vl_ubcmatch(descOb, descSc, matchThreshold); 

% filter out matched features (without orientation/scale)
matchedFeatOb = featOb(1:2,matches(1,:));
matchedFeatSc = featSc(1:2,matches(2,:));


% parameters
N = 40;
t = 2;
k = 4;
T = 0.7 * size(matches,2); 

[inlierIndices, H] = ransacManual(matchedFeatOb, matchedFeatSc, T, t, k, N );

%size(inlierIndices,2)
%H

[inlierIndices, H] = ransacAdapted(matchedFeatOb, matchedFeatSc, t, k );

%size(inlierIndices,2)
%H




