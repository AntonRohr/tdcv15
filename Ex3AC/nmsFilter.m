function [ outputImage ] = nmsFilter( inputImage, radiusMask )

outputImage = zeros(size(inputImage));

[rows, cols] = size(inputImage);



for row = 1:rows
    for col = 1:cols
        
        icol = max(col-radiusMask, 1);
        irow = max(row-radiusMask, 1);
        
        jcol = min(col+radiusMask, cols);
        jrow = min(row+radiusMask, rows);
        
        
        roi = inputImage(irow:jrow, icol:jcol); % region of interest
        
        maxValue = max(roi(:));
        if maxValue == inputImage(row,col)
            outputImage(row,col) = maxValue;
        end
    end
end


end

