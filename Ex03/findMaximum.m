function [r_i, r_j] = findMaximum( input )
%FINDMAXIMUM �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

