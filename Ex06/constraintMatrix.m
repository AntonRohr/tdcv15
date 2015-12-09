function constraintMatrix = constraintMatrix( image_point, warped_point )
%CONSTRAINTMATRIX returns the constraint matrix given a point
%correspondence in homogeneous coordinates.

x = warped_point(1);
y = warped_point(2);
w = warped_point(3);

constraintMatrix = [ 0 0 0 -w*(image_point') y*(image_point)'; ...
    w*(image_point') 0 0 0 -x*(image_point')]

end

