function plotQuad(quad_params, colour)
    quadrangle = paramsToCoords(quad_params)';
    line([quadrangle(1,1) quadrangle(2,1)], [quadrangle(1,2) quadrangle(2,2)], 'Color', colour);
    line([quadrangle(2,1) quadrangle(4,1)], [quadrangle(2,2) quadrangle(4,2)], 'Color', colour);
    line([quadrangle(3,1) quadrangle(4,1)], [quadrangle(3,2) quadrangle(4,2)], 'Color', colour);
    line([quadrangle(1,1) quadrangle(3,1)], [quadrangle(1,2) quadrangle(3,2)], 'Color', colour);
end