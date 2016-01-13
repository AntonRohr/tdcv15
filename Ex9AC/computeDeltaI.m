function [ delta_i ] = computeDeltaI( img, mu_r, mu, gridCoordinates )
%COMPUTEDELTAI Summary of this function goes here
%   Detailed explanation goes here


tform = computeHomography(mu_r, mu);

warpedImg = imwarp(img, tform.invert, 'OutputView', imref2d(size(img)));

delta_i = zeros(size(gridCoordinates,1), 1);

for i = 1:size(delta_i,1)
    col = gridCoordinates(i,2);
    row = gridCoordinates(i,1);
    delta_i(i) = warpedImg(row,col);
end



end

