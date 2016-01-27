image = im2double(imread('img.jpeg'));
%image = im2double(imread('img_girl.jpg'));

% template measures [row, col]
templateTL = [337, 365]; % TL = TopLeft
templateBR = [400, 450]; % BR = BottomRight
%templateTL = [400, 800]; % TL = TopLeft
%templateBR = [600, 1100]; % BR = BottomRight

% parameter
searchWinFac = 100;
nbPyramids = 20;

%% showroom 
%performTask(image, templateTL, templateBR, 1, 20, 'em', searchWinFac, 0, 1)

%%measuring



resultSSDGray = zeros(nbPyramids,3);
resultSSDRGB = zeros(nbPyramids,3);
resultNCCGray = zeros(nbPyramids,3);
resultNCCRGB = zeros(nbPyramids,3);
resultEMRGB = zeros(nbPyramids,3);

for i = nbPyramids:-1:1
    resultSSDGray(i,:) = performTask(image, templateTL, templateBR, 1, i, 'ssd',searchWinFac, 0, 0);
    resultSSDRGB(i,:) = performTask(image, templateTL, templateBR, 0, i, 'ssd', searchWinFac, 0,0);
    resultNCCGray(i,:) = performTask(image, templateTL, templateBR, 1, i, 'ncc', searchWinFac, 0,0);
    resultNCCRGB(i,:) = performTask(image, templateTL, templateBR, 0, i, 'ncc', searchWinFac, 0,0);
    resultEMRGB(i,:) = performTask(image, templateTL, templateBR, 0, i, 'em', searchWinFac, 3,0);
    i
end
