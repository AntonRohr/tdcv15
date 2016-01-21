function [ result ] = nccPowerFunc( template, roi )
%NCC Summary of this function goes here
%   Detailed explanation goes here


rootTemp = sqrt(sum(sum(template.^2)));

numerator = sum(sum(template .* roi));       
rootImage = sqrt(sum(sum(roi.^2)));

result = numerator / (rootTemp * rootImage);




end

