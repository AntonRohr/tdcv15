function c = domainFilter(Xi, central, sigmaD)

dist = norm(Xi - central);
c = exp((-1/2)*((dist/sigmaD)^2));

end