function c = domainFilter(Xi, central, sigmaD)

    c = zeros(size(Xi));

    for x = 1:size(Xi,1)
        for y= 1:size(Xi,2)
            dist = norm([x,y] - central);
            c(x,y) = exp((-1/2)*((dist/sigmaD)^2));
        end
    end


end