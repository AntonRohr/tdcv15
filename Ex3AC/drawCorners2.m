function [ output ] = drawCorners2( image, list )
%DRAWRECT Summary of this function goes here
%   Detailed explanation goes here


red = uint8([255 0 0]); % generate color yellow


shapeInserter = vision.ShapeInserter('Shape','Circles','BorderColor','Custom','CustomBorderColor',red); 


shapes = int32(list);


RGB = repmat(image,[1,1,3]);
output = step(shapeInserter, RGB, shapes);

end

