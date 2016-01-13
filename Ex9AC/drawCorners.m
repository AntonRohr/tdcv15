function [ output ] = drawCorners( image, list, shape )
%DRAWRECT Summary of this function goes here
%   Detailed explanation goes here

radius = round(max(size(image)) / 100); % calculate radius size 

yellow = uint8([255 255 0]); % generate color yellow

list = [list(:,2) list(:,1)];

if strcmp(shape, 'circle')

    shapeInserter = vision.ShapeInserter('Shape','Circles','BorderColor','Custom','CustomBorderColor',yellow); 

    radiuses(1:size(list,1), 1) = radius; 
    circles = [list radiuses];

    shapes = int32(circles);
end

if strcmp(shape, 'rectangle')

    shapeInserter = vision.ShapeInserter('Shape','Rectangles','BorderColor','Custom','CustomBorderColor',yellow);

    widths(1:size(list,1), 1) = 2*radius;
    heights(1:size(list,1), 1) = 2*radius;
    rects = [list-radius widths heights];
    shapes = int32(rects);

end

RGB = repmat(image,[1,1,3]);
output = step(shapeInserter, RGB, shapes);

end

