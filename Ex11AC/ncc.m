function [ scoreImage ] = ncc( template, image )
%NCC Summary of this function goes here
%   Detailed explanation goes here


rootTemp = sqrt(sum(sum(template.^2)));

scoreImage = zeros(size(image,1)-size(template,1),(size(image,2)-size(template,2)));

for row = 1:(size(image,1)-size(template,1))
    for col = 1:(size(image,2)-size(template,2))
       roiImg = image(row:row+size(template,1)-1,col:col+size(template,2)-1);
       
       numerator = sum(sum(template .* roiImg));       
       rootImage = sqrt(sum(sum(roiImg.^2)));
             
       scoreImage(row,col) = numerator / (rootTemp * rootImage);
              
    end   
end




end

