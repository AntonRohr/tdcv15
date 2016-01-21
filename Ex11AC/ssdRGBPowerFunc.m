function [ result ] = ssdRGBPowerFunc( template, roi )
%TMP Summary of this function goes here
%   Detailed explanation goes here

result = 0;
for ch = 1: size(template, 3)
    result = result + ssdGrayPowerFunc(template(:,:,ch), roi(:,:,ch));
end

result = result / size(template,3);

end

