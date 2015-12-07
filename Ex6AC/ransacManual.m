function [ inlierIndices, H ] = ransacManual(matchedFeatOb, matchedFeatSc, T, t, k, N )
%RANSAC Summary of this function goes here
%   Detailed explanation goes here

maxInliersCount = 0;

i = 0;
% iterate until enough inliers are found, or at max N times
while maxInliersCount < T && i < N
    
    % increase i counter
    i = i+1;
    
    % compute one ransac Step
    resultIndices = ransacStep( matchedFeatOb, matchedFeatSc, k, t);
    
    % check if result better than last iteration
    % iff yes, then safe the current results
    if size(resultIndices,2) > maxInliersCount
       maxInliersCount = size(resultIndices,2);
       inlierIndices = resultIndices;
    end

end



%% refine H with all inliers
% get the pixel coordinates of the inliers in both scene and object
objectFinalSamples = matchedFeatOb(:,inlierIndices);
sceneFinalSamples = matchedFeatSc(:,inlierIndices);

% compute final H
H = dlt(objectFinalSamples,sceneFinalSamples);

% normalize H
H = H / H(3,3);

end

