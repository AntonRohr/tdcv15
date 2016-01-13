function grid = initGrid( min_x, max_x, min_y, max_y )
%initGrid initializes a grid of points in steps of 5
k = 1;
grid = zeros(2, ((max_y - min_y) /5 -2)*((max_x - min_x)/5)- 2);
for i = (min_x+5):5:(max_x-5)
    for j = (min_y+5):5:(max_y-5)     
        grid(1,k) = i;
        grid(2,k) = j;
        k = k+1;
    end
end


end

