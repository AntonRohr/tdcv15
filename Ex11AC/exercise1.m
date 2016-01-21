inputImageRGB = imread('2043_000162.jpeg');
inputImageGray = rgb2gray(inputImageRGB);

% template measures
topLeftRow = 337;
topLeftCol = 365;
botRightRow = 400;
botRightCol = 450;

templateRGB = inputImageRGB(topLeftRow:botRightRow, topLeftCol:botRightCol, :);
templateGray = inputImageGray(topLeftRow:botRightRow, topLeftCol:botRightCol);


%scoresNCC = ncc(im2double(templateGray),im2double(inputImageGray));
%[maxNCCrow, maxNCCcol] = find(scoresNCC==max(max(scoresNCC)),1);

scales = 10;

for i = 1:scales
    templateGrayScaled = imresize(templateGray, i/scales);
    inputImageGrayScaled = imresize(inputImageGray, i/scales);
    
    scoresSSD = ssd(im2double(templateGrayScaled), im2double(inputImageGrayScaled));
    [minSSDrow, minSSDcol] = find(scoresSSD==min(min(scoresSSD)),1);
    
    drawedImg = drawRectangle(imresize(inputImageRGB,i/scales), minSSDrow, minSSDcol, minSSDrow+size(templateGrayScaled,1), minSSDcol+size(templateGrayScaled,2));
    imshow(drawedImg);
    disp(i/scales);
    
    minSSDrow = minSSDrow*(scales/i);
    minSSDcol = minSSDcol*(scales/i);


    drawedImg = drawRectangle(inputImageRGB, minSSDrow, minSSDcol, minSSDrow+(size(templateGrayScaled,1)*(scales/i)), minSSDcol+(size(templateGrayScaled,2)*(scales/i)));
    imshow(drawedImg);
    disp(scales/i);
end




%drawedImg = drawRectangle(inputImageRGB, minSSDrow, minSSDcol, minSSDrow+size(templateRGB,1), minSSDcol+size(templateRGB,2));

