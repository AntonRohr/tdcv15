%Get the names of the images in the sequence
fileFolder = fullfile('img_sequence');
dirOutput = dir(fullfile(fileFolder,'*.png'));
fileNames = {dirOutput.name}';

sequence = zeros(480, 640, size(fileNames,1));
%Read in the sequence
for i = 1:length(fileNames)
    sequence(:,:,i) = rgb2gray(imread(['img_sequence/' fileNames{i}]));
end

%Do SIFT and matching in one pass
%Should preallocate here to make it faster
for i = 1:size(sequence,3)
    %Perform SIFT for each image
    [feature,descriptor] = vl_sift(single(sequence(:,:,i)));
    features{i} = feature;
    
    %Perform matching
    [match, score] = vl_ubcmatch(features{i},f_0);
    matches{i} = match;
end

%Compute inliers