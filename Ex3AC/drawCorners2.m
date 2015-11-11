function [ output ] = drawCorners2( image, list )
%DRAWRECT Summary of this function goes here
%   Detailed explanation goes here


list = [list(:,2) list(:,1) list(:,4).*2];

red = uint8([255 0 0]); % generate color red


shapeInserter = vision.ShapeInserter('Shape','Circles','BorderColor','Custom','CustomBorderColor',red); 


shapes = int32(list);


RGB = repmat(image,[1,1,3]);
output = step(shapeInserter, RGB, shapes);

for i = 1:size(list,1)
    output(list(i,2),list(i,1),:) = [0 255 0]; 
end

end

