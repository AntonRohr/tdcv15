function [ result ] = ssdGrayPowerFunc( template, roi )
%TMP Summary of this function goes here
%   Detailed explanation goes here

diffMat = template - roi;
diffMat = diffMat.^2;

result = sum(sum(diffMat));

end

