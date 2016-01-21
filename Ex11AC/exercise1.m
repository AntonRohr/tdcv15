inputImageRGB = imread('2043_000162.jpeg');
inputImageGray = rgb2gray(inputImageRGB);

% template measures
topLeftRow = 337;
topLeftCol = 365;
botRightRow = 400;
botRightCol = 450;

templateRGB = inputImageRGB(topLeftRow:botRightRow, topLeftCol:botRightCol, :);
templateGray = inputImageGray(topLeftRow:botRightRow, topLeftCol:botRightCol);


%scoresSSD = ssd(im2double(templateGray), im2double(inputImageGray));
%scoresNCC = ncc(im2double(templateGray),im2double(inputImageGray));

[minSSDrow, minSSDcol] = find(scoresSSD==min(min(scoresSSD)),3);


drawedImg = drawRectangle(inputImageRGB, minSSDrow, minSSDcol, minSSDrow+size(templateRGB,1), minSSDcol+size(templateRGB,2));

imshow(drawedImg);