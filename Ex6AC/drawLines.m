function [ RGBoutput ] = drawLines( grayImage, list, color )
%DRAWLINES Summary of this function goes here
%   Detailed explanation goes here



lines = int32(list);
RGB = repmat(grayImage,[1,1,3]);
RGBoutput = insertShape(RGB, 'Line', lines, 'LineWidth', 1, 'Color', color);

%output = insertShape(RGBimage, 'Line', lines, 'Color', color);

end

