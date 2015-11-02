function [ outputImage ] = medianFilter( inputImage, sizeM, sizeN )

padM = floor(sizeM/2);
padN = floor(sizeN/2);

%paddedImage = padding(inputImage, padM, padN, 'mirror');

outputImage = zeros(size(inputImage));

[rows, cols] = size(outputImage);

for x = 1:rows
    for y = 1:cols
        
        ix = max(x-padM, 1);
        iy = max(y-padN, 1);
        
        jx = min(x+padM, cols);
        jy = min(y+padN, rows);
        
        
        %tmp = paddedImage(x:x+sizeM-1, y:y+sizeN-1);
        
        tmp = inputImage(ix:jx, iy:jy);
        
        outputImage(x,y) = median(tmp(:));
    end
end


end

