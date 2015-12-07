% read in the images
boxImageRGB = imread('box.pgm');
sceneImageRGB = imread('scene.pgm');

% preprocess
boxImage = im2single(boxImageRGB);
sceneImage = im2single(sceneImageRGB);

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

% get k random indices from the matches
k = 10;
sampleIndices = randsample(size(matchedFeatOb,2),k);

% get the pixel coordinates in both scene and object
objectSamples = matchedFeatOb(:,sampleIndices);
sceneSamples = matchedFeatSc(:,sampleIndices);

% compute H
H = dlt(objectSamples,sceneSamples);