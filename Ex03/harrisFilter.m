function output = harrisFilter( input, sigma_i, sigma_d, alpha )
%HARRISFILTER computes the Harris filter response over an image

output = zeros(size(input));

%1-D discrete derivative masks
d_x = [-1,0,1];
d_y = d_x';
%sigma_d gaussian filter
gaussian_d = gaussian2D(sigma_d);
%sigma_i gaussian filter
gaussian_i = gaussian2D(sigma_i);

%smooth the image
d_smoothed_image = conv2(gaussian_d, input);

%first derivatives
image_x = conv2(d_x, d_smoothed_image);
image_y = conv2(d_y, d_smoothed_image);

%second derivatives
image_x_x = conv2(d_x, image_x);
image_x_y = conv2(d_y, image_x);
image_y_y = conv2(d_y, image_y);

for i = 1:size(output,2)
    for j = 1:size(output,1)
            cross_derivatives = [image_x_x(j,i),image_x_y(j,i);image_x_y(j,i),image_y_y(j,i)];
            M = (sigma_d^2) * conv2(gaussian_i, cross_derivatives);
            output(j,i) = harris_response(M, alpha);
    end
end

