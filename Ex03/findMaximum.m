function [r_i, r_j] = findMaximum( input )
%FINDMAXIMUM 此处显示有关此函数的摘要
%   此处显示详细说明
r_i = 1;
r_j = 1; 
[row, col] = size(input);
max = 0;
for i = 1 : row
    for j = 1 : col
        if input(i,j) > max
            max = input(i,j);
            r_i = i;
            r_j = j;
        end
    end
end

