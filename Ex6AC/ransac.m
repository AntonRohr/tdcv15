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

% get k random indices from the matches
k = 10;
sampleIndices = randsample(size(matchedFeatOb,2),k);

% get the pixel coordinates in both scene and object
objectSamples = matchedFeatOb(:,sampleIndices);
sceneSamples = matchedFeatSc(:,sampleIndices);

% compute H
H = dlt(objectSamples,sceneSamples);


homographyMatches = H * [ matchedFeatOb ; ones(1,size(matchedFeatOb,2)) ]

homographyMatches = [ homographyMatches(1,:) ./ homographyMatches(3,:) ; homographyMatches(2,:) ./ homographyMatches(3,:)] %; homographyMatches(3,:) ./ homographyMatches(3,:) ]

diff = homographyMatches - matchedFeatSc;

dist = diff .* diff;

norm = sqrt(dist(1,:) + dist(2,:));

t = 10;
result = find(norm<t)