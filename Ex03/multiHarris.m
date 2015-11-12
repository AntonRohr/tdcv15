function output = multiHarris( input, level, s0, step, alpha, t)
%MULTIHARRIS
%
input = double(input);
[row,col] = size(input);
output = zeros(row,col,level);
for i = 1 : level
    sigma_i = step^i * s0;
    sigma_d = 0.7 * sigma_i;
    output(:,:,i) = harrisFilter(input, sigma_i, sigma_d, alpha, t);
end

end

