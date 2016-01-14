function [ images ] = readImages( )
%READIMAGE Summary of this function goes here
%   Detailed explanation goes here

file = dir('sequence');
NF = length(file)-2;
images = cell(NF,1);

% k + 2 because we want to ignore two hidden files in the folder
for k = 1 : NF
  images{k} = rgb2hsv(imread(fullfile('sequence', file(k+2).name)));
end

end

