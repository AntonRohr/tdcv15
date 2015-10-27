function discrete_gaussian = discreteGaussian( n, sigma )
%discreteGaussian returns a discrete gaussian over array size n

if sigma == 0
    error('Sigma must be nonzero!');

%Todo: generalise for non-odd cases; kernel should be arbitrary
elseif mod(n, 2) == 0
    error('n should be odd!');

else    
    %Initialize the output array
    middle = floor(n/2) + 1;
    discrete_gaussian = zeros(1,n);

    for i = middle:length(discrete_gaussian)
        x = i - middle;
        %TODO: Extract the actual Gaussian function
        discrete_gaussian(i) = (1/(sigma*sqrt(2*pi)))*exp(-(x^2)/(sigma^2));
    end
    
    
%Because the gaussian distribution is symmetric
discrete_gaussian(1:middle-1) = fliplr(discrete_gaussian(middle+1:end));
end

