function [ outputImage ] = medianFilter( inputImage, sizeM, sizeN )

padM = floor(sizeM/2);
padN = floor(sizeN/2);

outputImage = zeros(size(inputImage));

[rows, cols] = size(outputImage);

for x = 1:rows
    for y = 1:cols
        
        ix = max(x-padM, 1);
        iy = max(y-padN, 1);
        
        jx = min(x+padM, cols);
        jy = min(y+padN, rows);
        
        
        roi = inputImage(ix:jx, iy:jy); % region of interest
        
        outputImage(x,y) = median(roi(:));
    end
end


end

