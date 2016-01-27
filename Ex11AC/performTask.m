function [ output ] = performTask( image, templateTL, templateBR,  gray, pyrLevels, functionType, searchWinFac ,t, visualOutput)
%PERFORMTASK Summary of this function goes here
%   Detailed explanation goes here


template = image(templateTL(1):templateBR(1), templateTL(2):templateBR(2), :);

savedImg = image;

if(gray == 1)
    template = rgb2gray(template);
    image = rgb2gray(image);
    
    if strcmp(functionType, 'ssd')
        powerFunc = @ssdGrayPowerFunc;
        resultFunc = @findMin;
    else 
        powerFunc = @nccGrayPowerFunc;
        resultFunc = @findMax;
    end
     
else 
    if strcmp(functionType, 'ssd')
        powerFunc = @ssdRGBPowerFunc;
        resultFunc = @findMin;
    elseif strcmp(functionType, 'ncc')
        powerFunc = @nccRGBPowerFunc;
        resultFunc = @findMax;
    else
        image = Ofunction(image,t);
        template = Ofunction(template,t);
        powerFunc = @emPowerFunc;
        resultFunc = @findMax;
    end
    
end


%initialize search window [row col]
searchWinTL = [1,1];
searchWinBR = size(image(:,:,1));

tic;
for i = 1:pyrLevels
    
    scale = i/pyrLevels; % set the scaling factor
    
    resultTL = templateMatching(template, image, powerFunc, resultFunc, scale, searchWinTL, searchWinBR);
    
    resultBR = resultTL + size(template(:,:,1));
    
    if visualOutput
        drawedImg = drawRectangle(savedImg, resultTL(1), resultTL(2), resultBR(1), resultBR(2), 'red');
        drawedImg = drawRectangle(drawedImg, searchWinTL(1), searchWinTL(2), searchWinBR(1), searchWinBR(2), 'green');
        imshow(drawedImg);
        
        pause(0.1);
    end
    
    searchWinTL = resultTL - round(size(image(:,:,1))/(scale*searchWinFac));
    searchWinBR = resultBR + round(size(image(:,:,1))/(scale*searchWinFac));
    
    
    
end
eltime = toc;


output = [eltime, checkResult([resultTL, resultBR],[templateTL, templateBR])];

%drawedImg = drawRectangle(inputImageRGB, resultTL(1), resultTL(2), resultBR(1), resultBR(2));
%imshow(drawedImg);
%disp('');



end

