function output = laplacianFilter( input, sigma_i, sigma_d, t )
%LAPLACIANRESPONSE compute the laplacian response at at point in the image

%sigma_d gaussian filter
gaussian_d = gaussian2D(sigma_d);
smoothed_image = imfilter(input, gaussian_d, 'replicate');

%1-D discrete derivative masks
d_x = [-1,0,1];
d_y = d_x';

input_x = imfilter(smoothed_image, d_x,'replicate');
input_y = imfilter(smoothed_image, d_y,'replicate');

input_x_x = imfilter(input_x, d_x,'replicate');
input_y_y = imfilter(input_y, d_y,'replicate');

%Calculate the response
output = abs((sigma_i^2)*(input_x_x + input_y_y));
%Threshold the response
output(output<t) = 0;
end

