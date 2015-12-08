% read in the images
boxImageGray = imread('box.pgm');
sceneImageGray = imread('scene.pgm');

% create Features and match them
[matchedFeatBox, matchedFeatSc] = createFeatureMatches(boxImageGray, sceneImageGray);

% visualize all matches
allMatches = drawMatches(sceneImageGray, boxImageGray, matchedFeatSc, matchedFeatBox);

% parameters
N = 40;
t = 2;
k = 4;
T = 0.7 * size(matchedFeatSc,2); 

[inlierIndices, H] = ransacManual(matchedFeatBox, matchedFeatSc, T, t, k, N );

% visualize inliers method Manual
matchesManual = drawMatches(sceneImageGray, boxImageGray, matchedFeatSc(:,inlierIndices), matchedFeatBox(:,inlierIndices));


[inlierIndices, H] = ransacAdapted(matchedFeatBox, matchedFeatSc, t, k );

% visualize inliers method Adaptive
matchesAdapted = drawMatches(sceneImageGray, boxImageGray, matchedFeatSc(:,inlierIndices), matchedFeatBox(:,inlierIndices));

subplot(2,2,1);
imshow(allMatches);
title('All Matches');

subplot(2,2,3);
imshow(matchesManual);
title('Pruned Matches: Manual');

subplot(2,2,4);
imshow(matchesAdapted);
title('Pruned Matches: Adaptive');