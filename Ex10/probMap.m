function [ probDist ] = probMap( img_reg_H, values )
%COLORPRBDTRB �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
probDist = zeros(size(img_reg_H));
for i = 1 : size(img_reg_H, 1)
    for j = 1 : size(img_reg_H, 2)
        index = round(img_reg_H(i,j)*255) + 1;
        probDist(i,j) = values(index);
    end
end
probDist = round(probDist .* (255/max(max(probDist))));
end

