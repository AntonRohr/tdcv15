function [ output ] = drawLines( RGBimage, list, color )
%DRAWLINES Summary of this function goes here
%   Detailed explanation goes here



lines = int32(list);

output = insertShape(RGBimage, 'Line', lines, 'LineWidth', 1, 'Color', color);
%output = insertShape(RGBimage, 'Line', lines, 'Color', color);

end

