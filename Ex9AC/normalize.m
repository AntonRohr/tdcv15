function [ normed ] = normalize( intensities )
%NORMALIZE Summary of this function goes here
%   Detailed explanation goes here


normed = intensities - mean(intensities);

normed = normed ./ std(normed);

end

