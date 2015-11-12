function [ output ] = drawLines( image, list )
%DRAWLINES Summary of this function goes here
%   Detailed explanation goes here

red = uint8([255 0 0]);

shapeInserter = vision.ShapeInserter('Shape','Lines','LineWidth',1,'BorderColor','Custom','CustomBorderColor',red); 

lines = int32(list);

RGB = repmat(image,[1,1,3]);
output = step(shapeInserter, RGB, lines);


end

