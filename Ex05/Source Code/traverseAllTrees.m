function [vote_x, vote_y] = traverseAllTrees( integral_image, x, y, trees, leaves )
%TRAVERSEALLTREES 此处显示有关此函数的摘要
%   此处显示详细说明

sum_px = 0;
sum_py = 0;
for i = 1 : 10
    tree = trees{i};
    leave = leaves{i};
    result = traverseTree(integral_image, x, y, tree, leave);
    px = result(2);
    py = result(3);
    sum_px = sum_px + px;
    sum_py = sum_py + py;
end

vote_x = floor(sum_px/10);
vote_y = floor(sum_py/10);

end

