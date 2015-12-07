function discrete_gaussian = discreteGaussian( sigma )
%discreteGaussian returns a discrete gaussian over array size 3 * sigma

if sigma == 0
    error('Sigma must be nonzero!');

else  
    size = 3*sigma;
    middle_point = ceil(size/2);
    mask = zeros(1,size);

for i=1:size
        mask(i) = (1/(sigma*sqrt(2*pi)))*exp(-1/2*((i-middle_point)^2)/(sigma^2));
end

discrete_gaussian = mask;
    
    
%Because the gaussian distribution is symmetric
%discrete_gaussian(1:middle-1) = fliplr(discrete_gaussian(middle+1:end));
end

