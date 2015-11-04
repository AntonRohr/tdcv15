function outputImage = bilateralFilter(inputImage, sigma, sigmaR)

% get image size
[rows, cols] = size(inputImage);
outputImage = zeros(rows,cols);


roiSizeX = 3*sigma;
roiSizeY = 3*sigma;

% central point of the roi
centralX = ceil(roiSizeX/2);
centralY = ceil(roiSizeY/2);

% compute the weightMatrix with the domainFilter function;
weightMatrix = domainFilter(zeros(roiSizeX, roiSizeY), [centralX, centralY], sigma);

progress = 0;
for x = 1:rows
    for y = 1:cols
        
        roiITLx = max(x-centralX+1, 1); % roi of Image Top Left X coordinate
        roiITLy = max(y-centralY+1, 1); % roi of Image Top Left Y coordinate
        
        roiIBRx = min(x-centralX+roiSizeX, rows); % roi of Image Bottom Right X coordinate
        roiIBRy = min(y-centralY+roiSizeY, cols); % roi of Image Bottom Right Y coordinate
        
        roiI = inputImage(roiITLx:roiIBRx, roiITLy:roiIBRy); % region of interest of Image;
        
        
        
        roiRanged = rangeFilter(roiI, inputImage(x,y), sigmaR); % compute range values
        
        roiWTLx = centralX -(x-roiITLx); % roi of Weights Top Left X coordinate
        roiWTLy = centralY -(y-roiITLy); % roi of Weights Top Left Y coordinate
        
        roiWBRx = centralX -(x-roiIBRx); % roi of Weights Bottom Right X coordinate
        roiWBRy = centralY -(y-roiIBRy); % roi of Weights Bottom Right Y coordinate
        

        roiW = weightMatrix(roiWTLx: roiWBRx, roiWTLy: roiWBRy); % region of interest of Weights

        c = sum(sum(roiRanged.*roiW));
        d = sum(sum(roiI.*roiRanged.*roiW));
        h = d / c;
        outputImage(x,y) = h;
        
    end
    % print progress
    if round((x*100)/rows) > progress
        progress = progress+1;
        if mod(progress, 10) == 0
            fprintf('%d',progress);
        else
        fprintf('.');
        end
    end
end
fprintf('\n');

end