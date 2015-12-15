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
for i = 2:size(sequence,3)
    %Perform SIFT for each image
    [feature,descriptor] = vl_sift(single(sequence(:,:,i)));
    features{i} = feature;
    
    %Perform matching
    [match, score] = vl_ubcmatch(f_0,features{i});
    matches{i} = match;
end

%Compute inliers - this breaks if we compute the inliers of the image
%itself
for i = 2:size(sequence,3)
    %Get point correspondences
    [m_0, m_i] = match_points(f_0, features{i}, matches{i});
    %Get inliers and a homography
    [homography, inliers_origin, inliers_target] = adaptiveRANSAC(m_0, m_i, 3, 40, 50);
    %Store them
    homography_i{i} = homography;
    inliers_0{i} = inliers_origin;
    inliers_i{i} = inliers_target;
end