function [ outputImage ] = mergeImages( image1, image2 )
%MERGEIMAGES Summary of this function goes here
%   Detailed explanation goes here



    if size(image1, 1) >= size(image2, 1)

        diff = size(image1, 1) - size(image2, 1);
        image2(end+1:end+diff,:,:) = zeros(diff, size(image2, 2),size(image2, 3)); 


    else 

        diff = size(image2, 1) - size(image1, 1);
        image1(end+1:end+diff,:,:) = zeros(diff, size(image1, 2), size(image1, 3));

    end

    outputImage = [image1, image2];

end

