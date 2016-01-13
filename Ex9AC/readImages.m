function [ images ] = readImages( )
%READIMAGE Summary of this function goes here
%   Detailed explanation goes here

file = dir('seq');
NF = length(file)-2;
images = cell(NF,1);

% here I need to specify "k+3" because we want to ignore '.' '..' and
% '0000.png' (i.e. the first three files in the folder)
for k = 1 : NF
  images{k} = imread(fullfile('seq', file(k+2).name));
end

end

