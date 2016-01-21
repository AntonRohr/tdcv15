inputImageRGB = imread('2043_000162.jpeg');
inputImageGray = rgb2gray(inputImageRGB);

% template measures 
templateTLR = 337; % TLR = TopLeftRow
templateTLC = 365; % TLC = TopLeftCol
templateBRR = 400; % BRR = BotRightRow
templateBRC = 450; % BRC = BotRightCol

templateRGB = inputImageRGB(templateTLR:templateBRR, templateTLC:templateBRC, :);
templateGray = inputImageGray(templateTLR:templateBRR, templateTLC:templateBRC);




%initialize search window [row col]
searchWinTL = [1,1];
searchWinBR = size(inputImageGray);

%% without pyramid

% ssd
%resultTL = templateMatching(im2double(templateGray), im2double(inputImageGray), @ssdGrayPowerFunc, @findMin, 1, searchWinTL, searchWinBR);
%resultTL = templateMatching(im2double(templateRGB), im2double(inputImageRGB), @ssdRGBPowerFunc, @findMin, 1, searchWinTL, searchWinBR);
% ncc
%resultTL = templateMatching(im2double(templateGray), im2double(inputImageGray), @nccGrayPowerFunc, @findMax, 1, searchWinTL, searchWinBR);
%resultTL = templateMatching(im2double(templateRGB), im2double(inputImageRGB), @nccRGBPowerFunc, @findMax, 1, searchWinTL, searchWinBR);


%resultBR = resultTL + size(templateGray);

%drawedImg = drawRectangle(inputImageRGB, resultTL(1), resultTL(2), resultBR(1), resultBR(2));
%imshow(drawedImg);
%disp('');

%% with pyramid searching

%how many pyramid levels are wanted
pyrLevels = 20;

for i = 1:pyrLevels
    
    scale = i/pyrLevels; % set the scaling factor
    
    % ssd
    resultTL = templateMatching(im2double(templateGray), im2double(inputImageGray), @ssdGrayPowerFunc, @findMin, scale, searchWinTL, searchWinBR);
    %resultTL = templateMatching(im2double(templateRGB), im2double(inputImageRGB), @ssdRGBPowerFunc, @findMin, scale, searchWinTL, searchWinBR);
    % ncc
    %resultTL = templateMatching(im2double(templateGray), im2double(inputImageGray), @nccGrayPowerFunc, @findMax, scale, searchWinTL, searchWinBR);
    %resultTL = templateMatching(im2double(templateRGB), im2double(inputImageRGB), @nccRGBPowerFunc, @findMax, scale, searchWinTL, searchWinBR);
    
    
    resultBR = resultTL + size(templateGray);
    
    searchWinTL = resultTL - round(size(inputImageGray)/(scale*50));
    searchWinBR = resultBR + round(size(inputImageGray)/(scale*50));
    
    drawedImg = drawRectangle(inputImageRGB, resultTL(1), resultTL(2), resultBR(1), resultBR(2));
    imshow(drawedImg);
    disp('');
    
end

