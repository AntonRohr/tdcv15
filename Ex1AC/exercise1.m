function [ aClamp, aMirror, b ] = exercise1( image )
%EXERCISE1 Summary of this function goes here
%   Detailed explanation goes here

aClamp = padding(image, 100, 100, 'clamp');

aMirror = padding(image, 100, 100, 'mirror');

mask = ones(3,3);
b = convFilter(image,mask,'mirror'); 

end

