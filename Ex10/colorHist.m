function [values] = colorHist( img_reg_H )
%COLORHIS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

values = zeros(1, 256);
for i = 1 : (size(img_reg_H(:)))
    index = round(img_reg_H(i)*255)+1;
    values(index) = values(index) + 1;
end

