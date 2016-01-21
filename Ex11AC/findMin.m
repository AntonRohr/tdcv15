function [ result ] = findMin( img )
%FINDMIN Summary of this function goes here
%   Detailed explanation goes here

[resrow, rescol] = find(img==min(min(img)),1);
result = [resrow, rescol];

end

