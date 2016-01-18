function [ probDist ] = probMap( img_reg_H, values )
%COLORPRBDTRB 此处显示有关此函数的摘要
%   此处显示详细说明
probDist = zeros(size(img_reg_H));
for i = 1 : size(img_reg_H, 1)
    for j = 1 : size(img_reg_H, 2)
        index = round(img_reg_H(i,j)*255) + 1;
        probDist(i,j) = values(index);
    end
end
probDist = round(probDist .* (255/max(max(probDist))));
end

