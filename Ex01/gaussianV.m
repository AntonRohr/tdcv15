function output = gaussianV( sigma )
%GAUSSIANV �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
size = 3*sigma;
middle_point = ceil(size/2);
mask = zeros(size,1);

for j=1:size
        mask(j,1) = (1/(sigma*sqrt(2*pi)))*exp(-1/2*((j-middle_point)^2)/(sigma^2));
end

output = mask;

end

