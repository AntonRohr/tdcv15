function output = gaussianH( sigma )
%GAUSSIANH �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
size = 3*sigma;
middle_point = ceil(size/2);
mask = zeros(1,size);

for i=1:size
        mask(i) = (1/(sigma*sqrt(2*pi)))*exp(-1/2*((i-middle_point)^2)/(sigma^2));
end

output = mask;
end



