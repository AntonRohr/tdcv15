function [ images ] = readImages( )
%READIMAGE Summary of this function goes here
%   Detailed explanation goes here

file = dir('img_sequence');
NF = length(file)-3;
images = cell(NF,1);

% here I need to specify "k+3" because we want to ignore '.' '..' and
% '0000.png' (i.e. the first three files in the folder)
for k = 1 : NF
  images{k} = imread(fullfile('img_sequence', file(k+3).name));
end

end

