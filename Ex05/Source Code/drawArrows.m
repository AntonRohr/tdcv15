function drawArrows( votemap, mx, my, I )
%DRAWARROWS 此处显示有关此函数的摘要
%   此处显示详细说明
points_x = [];
points_y = [];
count = 1;
for i = 1 : 500
    for j = 1 : 281
        if (votemap(j,i,1) == my) && (votemap(j,i,2) == mx)
            points_x(count) = i;
            points_y(count) = j;
            count = count + 1;
        end
    end
end
points_x
points_y
figure;
imagesc(I);
hold on;
for i = 1 : 63
    p1 = [points_x(i), points_y(i)];
    p2 = [mx, my];
    dp = p2 - p1;
    quiver(p1(1),p1(2),dp(1),dp(2),0);
end

end

