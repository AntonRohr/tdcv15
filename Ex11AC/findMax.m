function [ result ] = findMax( img )
%FINDMAX Summary of this function goes here
%   Detailed explanation goes here

[resrow, rescol] = find(img==max(max(img)),1);
result = [resrow, rescol];

end

