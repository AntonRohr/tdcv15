clc;clear;
[trees, leaves] = getAllTrees();
I = imread('2007_000032.jpg');
I_integral = getIntegralImage(I);
heatmap = zeros(281,500);
for i = 1 : 281
    for j = 1 : 500
        test = traverseTree(I_integral, j, i, trees{1}, leaves{1});
        rx = j + test(2);
        ry = i + test(3);
        if rx > 0 && rx < 282 && ry > 0 && ry < 501
            heatmap(ceil(rx),ceil(ry)) = heatmap(ceil(rx),ceil(ry)) + 1;
        end
    end
end
