clc;clear;
[trees, leaves] = getAllTrees();
I = imread('2007_000032.jpg');
I_integral = getIntegralImage(I);
heatmap = zeros(281,500);
votemap = zeros(281,500,2);
for i = 1 : 281
    for j = 1 : 500
        [vote_x, vote_y] = traverseAllTrees(I_integral, j, i, trees, leaves);
        rx = j + vote_x;
        ry = i + vote_y;
         if (rx > 0) && (rx < 282) && (ry > 0) && (ry < 501)
             heatmap(ry,rx) = heatmap(ry,rx) + 1;
             votemap(i,j,1) = ry;
             votemap(i,j,2) = rx;
         end
    end
end
figure;imagesc(heatmap); colormap gray;

[num, idx] = max(heatmap(:));
[my, mx] = ind2sub(size(heatmap),idx);

drawArrows(votemap, mx, my, I);