function displayCorners( image, corners, r )
%DISPLAYCORNERS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

figure;
imagesc(image);
colormap gray;
hold on;

[row, col, scale] = size(corners);
for s = 1 : scale
    for i = 1 : row
        for j = 1 : col
            if corners(i,j,s) > 0
                plot(i, j, 'or', 'markersize', r*s);
            end
        end
    end
end

hold off;
end

