function outputImage = bilateralFilter(inputImage, sigma)

% get image size
[rows, cols] = size(inputImage);
outputImage = zeros(rows,cols);


roiSizeX = 3*sigma;
roiSizeY = 3*sigma;

centralX = ceil(roiSizeX/2);
centralY = ceil(roiSizeY/2);

weightMatrix = zeros(roiSizeX, roiSizeY);

for m = 1:size(weightMatrix, 1)
    for n = 1:size(weightMatrix, 2)
        weightMatrix(m,n) = domainFilter([m,n], [centralX,centralY], sigma);
    end
end

for x = 1:rows
    for y = 1:cols
        
        roiITLx = max(x-centralX+1, 1); % roi of Image Top Left X coordinate
        roiITLy = max(y-centralY+1, 1); % roi of Image Top Left Y coordinate
        
        roiIBRx = min(x-centralX+roiSizeX, rows); % roi of Image Bottom Right X coordinate
        roiIBRy = min(y-centralY+roiSizeY, cols); % roi of Image Bottom Right Y coordinate
        
        roiI = inputImage(roiITLx:roiIBRx, roiITLy:roiIBRy); %region of interest of Image;
        
        
        
        roiRanged = rangeFilter2(roiI, inputImage(x,y), 0.1); % compute range values
        
        roiWTLx = centralX -(x-roiITLx); % roi of Weights Top Left X coordinate
        roiWTLy = centralY -(y-roiITLy); % roi of Weights Top Left Y coordinate
        
        roiWBRx = centralX -(x-roiIBRx); % roi of Weights Bottom Right X coordinate
        roiWBRy = centralY -(y-roiIBRy); % roi of Weights Bottom Right Y coordinate
        

        roiW = weightMatrix(roiWTLx: roiWBRx, roiWTLy: roiWBRy); %region of interest of Weights

        
        
        %tmp = roiRanged.*roiW;
        
        
        c = sum(sum(roiRanged.*roiW));
        d = sum(sum(roiI.*roiRanged.*roiW));
        h = d / c;
        outputImage(x,y) = h;
        
    end
    
end

end