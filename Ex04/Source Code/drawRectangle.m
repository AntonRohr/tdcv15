function drawRectangle( image, range )
%DRAW �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
figure;
imagesc(image);
hold on;
rectangle('position', range, 'edgecolor','r', 'LineWidth',3);
hold off;

end

