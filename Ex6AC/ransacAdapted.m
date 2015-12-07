function [ inlierIndices, H ] = ransacAdapted( matchedFeatOb, matchedFeatSc, t, k )
%RANSAC Summary of this function goes here
%   Detailed explanation goes here


maxInliersCount = 0;

N = 10000000;
sample_count = 0;

while N > sample_count
    
    % compute one ransac Step
    resultIndices = ransacStep( matchedFeatOb, matchedFeatSc, k, t);
    
    % check if result better than last iteration
    % iff yes, then safe the current results
    if size(resultIndices,2) > maxInliersCount
       maxInliersCount = size(resultIndices,2);
       inlierIndices = resultIndices;
    end
    
    epsilon = 1 - (maxInliersCount / size(matchedFeatOb,2));
    p = 0.99;
    N = log(1-p)/log(1-(1-epsilon)^k);
    
    sample_count = sample_count+1;
    
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

