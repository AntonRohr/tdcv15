function [ scoreImage ] = ssd( template, image )
%SSD Summary of this function goes here
%   Detailed explanation goes here

scoreImage = zeros(size(image,1)-size(template,1),(size(image,2)-size(template,2)));

for row = 1:(size(image,1)-size(template,1))
    for col = 1:(size(image,2)-size(template,2))
       roiImg = image(row:row+size(template,1)-1,col:col+size(template,2)-1);
       
       diffMat = template - roiImg;
       diffMat = diffMat.^2;
       
       scoreImage(row,col) = sum(sum(diffMat));
       
    end   
end

end

