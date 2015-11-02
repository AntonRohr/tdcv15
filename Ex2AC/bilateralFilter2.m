function outputImage = bilateralFilter2(inputImage, sigma)

% get image size
[rows, cols] = size(inputImage);
outputImage = zeros(rows,cols);

halfSigmaX = floor(3*sigma/2);
halfSigmaY = floor(3*sigma/2);

centralX = halfSigmaX +1;
centralY = halfSigmaY +1;

weightMatrix = zeros(3*sigma, 3*sigma);

for m = 1:3*sigma
    for n = 1:3*sigma
        weightMatrix(m,n) = domainFilter([m,n], [halfSigmaX+1,halfSigmaY+1], sigma);
    end
end

for x = 1:rows
    for y = 1:cols
        
        ix = max(x-halfSigmaX, 1);
        iy = max(y-halfSigmaY, 1);
        
        jx = min(x+halfSigmaX, cols);
        jy = min(y+halfSigmaY, rows);
        
        roiI = inputImage(ix:jx, iy:jy); %region of interest of Image;
        
        
        focus = inputImage(x,y);
        
        roiRanged = rangeFilter2(roiI, focus, 0.1);
        %roiRanged = arrayfun(@rangeFilter, roiI, repmat(focus, size(roiI, 1), size(roiI, 2)), repmat(0.1, size(roiI, 1), size(roiI, 2)));
        
        

        roiW = weightMatrix(centralX -x +ix: centralX -x +jx, centralY -y +iy: centralY -y +jy); %region of interest of Weights
        
        c = sum(sum(roiRanged.*roiW));
        
        outputImage(x,y) = sum(sum(roiI.*roiRanged.*roiW)) / c;
        
    end
end

end