function [ pd ] = probMap( roi, histogram )
%PROBMAP Summary of this function goes here
%   Detailed explanation goes here

pd = zeros(size(roi));
for row = 1:size(roi,1)
    for col = 1:size(roi,2)
        hue = round(roi(row,col)*255)+1;
        pd(row,col) = histogram(hue);
    end
end

pd = round(pd .* (255/max(max(pd))));




end

