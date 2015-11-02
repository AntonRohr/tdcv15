function r = rangeFilter(intensityXi, intensityX, sigmaR)

intensityDistance = norm(intensityXi - intensityX);
r = exp((-1/2) * (intensityDistance/sigmaR)^2);


end


