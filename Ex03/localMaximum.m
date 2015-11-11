function output = localMaximum( input )
%LOCALMAXIMUM 此处显示有关此函数的摘要
%   此处显示详细说明
[row, col, level] = size(input);
output = [row,col,level];
for l=1 : level
    for i = 1 : row - 2
        for j = 1 : col - 2
            local = input(i:i+2,j:j+2,l);
            [r_i, r_j] = findMaximum(local);
            output(i+r_i-1,j+r_j-1,l) = 1;
        end
    end
end

for l = 1:level
    output(:,:,l) = output(:,:,l) * input(:,:,l);
end
