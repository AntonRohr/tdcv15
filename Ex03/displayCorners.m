function displayCorners( image, corners, r )
%DISPLAYCORNERS
figure;
imagesc(image);
colormap gray;
hold on;

[row, col] = size(corners);
    for i = 1 : row
        for j = 1 : col
            if corners(i,j) > 0
                plot(j, i, 'or', 'markersize', r);
            end
        end
    end

hold off;
end

