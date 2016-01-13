function [ tform ] = computeHomography( mu1, mu2 )
%COMPUTEHOMOGRAPHY Summary of this function goes here
%   Detailed explanation goes here

mu1Trans = reshape(mu1,2,4)';
mu2Trans = reshape(mu2,2,4)';

tform = estimateGeometricTransform(mu1Trans, mu2Trans, 'projective');


end

