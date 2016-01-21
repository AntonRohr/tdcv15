function [ result ] = nccRGBPowerFunc( template, roi )
%NCCRGBPOWERFUNC Summary of this function goes here
%   Detailed explanation goes here

result = 0;
for ch = 1: size(template, 3)
    result = result + nccGrayPowerFunc(template(:,:,ch), roi(:,:,ch));
end

result = result / size(template,3);

end

