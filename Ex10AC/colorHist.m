function [ histogram ] = colorHist( roi )
%COLORHIST Summary of this function goes here
%   Detailed explanation goes here

histogram = zeros(1,256);

for i = 1:(size(roi,1)*size(roi,2))
    % hue = bucket
    hue = round(roi(i)*255)+1;
    histogram(hue) = histogram(hue)+1;   
end

end

