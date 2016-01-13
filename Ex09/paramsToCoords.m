function  coords = paramsToCoords( params )
%PARAMSTOCOORDS Transform a parameter vector back into a 2xN matrix of
%coordinates

coords = zeros(2,size(params,1)/2);

k=1;
for i = 1: size(params,1)
    if(mod(i,2) == 0)
        coords(2,k) = params(i);
        k = k+1;
    else
        coords(1,k) = params(i);
    end
end

