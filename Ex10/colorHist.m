function [values] = colorHist( img_reg_H )
%COLORHIS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% h = histogram(img_H_oneD);
% h.NumBins = 256
% ranges = h.BinEdges(2:end);
% values = h.Values;
values = zeros(1, 256);
for i = 1 : (size(img_reg_H,1) * size(img_reg_H,2))
    hue = round(img_reg_H(i)*255)+1;
    values(hue) = values(hue) + 1;
end

