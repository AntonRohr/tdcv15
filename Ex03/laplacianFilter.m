function output = laplacianFilter( input, sigma, t )
%LAPLACIANRESPONSE compute the laplacian response at at point in the image

%1-D discrete derivative masks
d_x = [-1,0,1];
d_y = d_x';

input_x = conv2(input, d_x,'same');
input_y = conv2(input, d_y,'same');

input_x_x = conv2(input_x, d_x,'same');
input_y_y = conv2(input_y, d_y,'same');

output = abs((sigma^2)*(input_x_x + input_y_y));
%Threshold the response
output(output<t) = 0;
end

