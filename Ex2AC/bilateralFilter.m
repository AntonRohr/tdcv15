function outputImage = bilateralFilter(inputImage, sigma)

% get image size
[rows, cols] = size(inputImage);
outputImage = zeros(rows,cols);

halfSigmaX = floor(3*sigma/2);
halfSigmaY = floor(3*sigma/2);

paddedImage = padding(inputImage, halfSigmaX, halfSigmaY, 'mirror');

for x = 1:rows
    for y = 1:cols
        currentPixel = inputImage(x,y);
        
        % compute c
        c = 0;
        d = 0;
        for i = x:x+3*sigma-1
            for j = y:y+3*sigma-1
                weight = domainFilter([i;j],[x;y],sigma);
                range = rangeFilter(paddedImage(i,j),inputImage(x,y),sigma);
                
                c = c+(weight*range);
                
                d = d+(paddedImage(i,j) * weight * range);
            end
        end
        
        h = d/c;
        outputImage(x,y) = h;
        
        
        tmp = paddedImage(x:x+3*sigma-1, y:y+3*sigma-1);
        
        
    end
end

end