function [] = plot_quadrangle(quadrangle, colour)
    quadrangle = quadrangle';
    for i = 1:size(quadrangle,1)
        if i == size(quadrangle,1) 
            line([quadrangle(i,1), quadrangle(1,1)], [quadrangle(i,2), quadrangle(1,2)], 'Color', colour);
        else
            line([quadrangle(i,1), quadrangle(i+1,1)], [quadrangle(i,2), quadrangle(i+1,2)], 'Color', colour);
        end
    end

end