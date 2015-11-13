function [ output ] = drawBB(RGBimage, corners, color )
%DRAWBB Summary of this function goes here
%   Detailed explanation goes here

% create bb lines (topleft -> topRight, topRight -> bottomRight, ...)
drawList = [corners(1,:), corners(2,:); corners(2,:), corners(3,:); corners(3,:), corners(4,:); corners(4,:), corners(1,:)];

output = drawLines(RGBimage, drawList, color);

end

