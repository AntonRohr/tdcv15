% Creates a uniform grid of points for a given quadrangle four points [x, y]
function grid = createGridQuadrangle(quadrangle, stepSize)
    x = quadrangle(:,1);
    y = quadrangle(:,2);
    %gridX = linspace(min(x), max(x), floor((max(x)-min(x)+1)/stepSize));
    %gridY = linspace(min(y), max(y), floor((max(y)-min(y)+1)/stepSize));
    
    %[X, Y] = meshgrid(gridX, gridY);
    [X, Y] = meshgrid(min(x):stepSize:max(x), min(y):stepSize:max(y));
    grid(:,1) = X(:);
    grid(:,2) = Y(:);
    
end