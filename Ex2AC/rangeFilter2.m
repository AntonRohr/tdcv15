function r = rangeFilter2(Xi, X, sigmaR)

r = zeros(size(Xi));

for x = 1:size(Xi,1)
    for y = 1:size(Xi,2)
        intensityDistance = norm(Xi(x,y) - X);
        r(x,y) = exp((-1/2) * (intensityDistance/sigmaR)^2);
    end
end



end


