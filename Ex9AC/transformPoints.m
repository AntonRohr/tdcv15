function [ muTransformed ] = transformPoints( tform, mu )
%TRANSFORMPOINTS Summary of this function goes here
%   Detailed explanation goes here

muShaped = reshape(mu,2,4)';

points = transformPointsForward(tform, muShaped);

muTransformed = reshape(points', 8,1);

end

