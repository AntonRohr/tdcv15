function output = multiHarris( input, level, s0, step, alpha, t )
%MULTIHARRIS 此处显示有关此函数的摘要
%   此处显示详细说明
input = double(input);
[row,col] = size(input);
output = zeros(row,col,level);
for i = 1 : level
    sigma_i = step^i * s0;
    sigma_d = 0.7 * sigma_i;
    output(:,:,i) = harrisFilter(input, sigma_i, sigma_d, alpha);
end

end

