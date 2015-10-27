function [ aDx, aDy, bGrad, bOrient ] = exercise3( image )


aDx = [-1,0,1;-1,0,1;-1,0,1];
aDy = [-1,-1,-1;0,0,0;1,1,1];

[bGrad, bOrient] = gradOrient(image, 'mirror');

end

