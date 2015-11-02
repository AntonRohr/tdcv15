function outputImage = bilateralFilter(inputImage, sigma)

% get image size
[rows, cols] = size(inputImage);
outputImage = zeros(rows,cols);

halfSigmaX = floor(3*sigma/2);
halfSigmaY = floor(3*sigma/2);

paddedImage = padding(inputImage, halfSigmaX, halfSigmaY, 'mirror');

weightMatrix = zeros(3*sigma, 3*sigma);

for m = 1:3*sigma
    for n = 1:3*sigma
        weightMatrix(m,n) = domainFilter([m,n], [halfSigmaX+1,halfSigmaY+1], sigma);
    end
end

for x = 1:rows
    for y = 1:cols
        
        % compute c
        c = 0;
        d = 0;
        for i = x:x+3*sigma-1
            for j = y:y+3*sigma-1
                %weight = domainFilter([i;j],[x;y],sigma);
                weight = weightMatrix(i-x+1, j-y+1);
                
                range = rangeFilter(paddedImage(i,j),inputImage(x,y),0.1);
                
                c = c+(weight*range);
                
                d = d+(paddedImage(i,j) * weight * range);
            end
        end
        
        h = d/c;
        outputImage(x,y) = h;
        
        
        %tmp = paddedImage(x:x+3*sigma-1, y:y+3*sigma-1);
        
        
    end
end

end