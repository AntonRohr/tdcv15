function [ output ] = drawCorners( image, list )
%DRAWRECT Summary of this function goes here
%   Detailed explanation goes here

radius = round(max(size(image)) / 100); % calculate radius size 

color = uint8([255 0 0]); % generate color (red)

list = [list(:,2) list(:,1)];



shapeInserter = vision.ShapeInserter('Shape','Circles','BorderColor','Custom','CustomBorderColor',color); 

radiuses(1:size(list,1), 1) = radius; 
circles = [list radiuses];

shapes = int32(circles);



output = step(shapeInserter, image, shapes);

end

