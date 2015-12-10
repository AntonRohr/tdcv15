function [ indices ] = ransacStep( matchedFeatOb, matchedFeatSc, k, t)
%RANSACSTEP Summary of this function goes here
%   Detailed explanation goes here

% get k random indices from the matches
sampleIndices = randsample(size(matchedFeatOb,2),k);

% get the pixel coordinates in both scene and object
objectSamples = matchedFeatOb(:,sampleIndices);
sceneSamples = matchedFeatSc(:,sampleIndices);

% compute H via DLT
H = dlt(objectSamples,sceneSamples);

% transform all object features with H; 
homographyMatches = H * [ matchedFeatOb ; ones(1,size(matchedFeatOb,2)) ];

% normalize homographyMatches (only save 2 coordinates)
homographyMatches = [ homographyMatches(1,:) ./ homographyMatches(3,:) ; homographyMatches(2,:) ./ homographyMatches(3,:)];

% compute distances
squaredDiff = (homographyMatches - matchedFeatSc).^2;
distances = sqrt(squaredDiff(1,:) + squaredDiff(2,:));

% find indices that are indices
indices = find(distances<t);


end

