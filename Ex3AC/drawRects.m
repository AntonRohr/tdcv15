function [ output ] = drawRects( input, list )
%DRAWRECT Summary of this function goes here
%   Detailed explanation goes here

yellow = uint8([255 255 0]);
shapeInserter = vision.ShapeInserter('Shape','Circles','BorderColor','Custom','CustomBorderColor',yellow);



radiuses(1:size(list,1), 1) = 6;

list = [list radiuses];

circles = int32(list);


RGB = repmat(input,[1,1,3]);

output = step(shapeInserter, RGB, circles);

end

