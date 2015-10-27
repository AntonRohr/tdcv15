function kernel = gaussianKernel2d( n, sigma )
%GAUSSIANKERNEL Generates a symmetric n*n gaussian kernel
%   Multiplies together the result of two 1D gaussians

horizontal = discreteGaussian(n, sigma);
vertical = horizontal';

kernel = repmat(horizontal,n,1).*repmat(vertical,1,n);


end

