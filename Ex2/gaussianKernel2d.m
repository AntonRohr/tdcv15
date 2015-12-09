function output = gaussianKernel2d( sigma )
%get 3sigma*3sigma 2D gaussian filter mask 
size = 3*sigma;
%Initialize the mask
mask = ones(3*sigma);
%Get the origin point of Gaussian kernel
middle_point = ceil(size/2);
%Generate the mask
for i=1:size
    for j=1:size
        u = i - middle_point;
        v = j - middle_point;
        mask(i,j) = 1/(2*pi*sigma^2)*exp(-1/2*(u^2+v^2)/sigma^2);
    end
end

output = mask;

