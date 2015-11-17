function drawRectangle( image, range )
%DRAW 此处显示有关此函数的摘要
%   此处显示详细说明
figure;
imagesc(image);
hold on;
rectangle('position', range, 'edgecolor','r', 'LineWidth',3);
hold off;

end

