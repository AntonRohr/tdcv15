function output = harrisFilter( input, sigma_i, sigma_d, alpha , t)
%HARRISFILTER computes the Harris filter response over an image
input = double(input);
output = zeros(size(input));

%1-D discrete derivative masks
d_x = [-1,0,1];
d_y = d_x';
%sigma_d gaussian filter
gaussian_d = gaussian2D(sigma_d);
%sigma_i gaussian filter
gaussian_i = gaussian2D(sigma_i);

%smooth the image
d_smoothed_image = imfilter(input,gaussian_d,'replicate');

%first derivatives
image_x = imfilter(d_smoothed_image, d_x,'replicate');
image_y = imfilter(d_smoothed_image, d_y,'replicate');

%second moments
image_x_y = image_x.*image_y;
image_x_x = image_x.^2;
image_y_y = image_y.^2;

%smoothed second moments
image_x_y = imfilter(image_x_y, gaussian_i, 'replicate');
image_x_x = imfilter(image_x_x, gaussian_i, 'replicate');
image_y_y = imfilter(image_y_y, gaussian_i, 'replicate');

for i = 1:size(output,2)
    for j = 1:size(output,1)
            second_moment_matrix = [image_x_x(j,i),image_x_y(j,i);image_x_y(j,i),image_y_y(j,i)];
            M = (sigma_d^2) * second_moment_matrix;
            output(j,i) = harris_response(M, alpha);
    end
end

%thresholding
output(output<t) = 0;

%non-maximum suppression
output = suppressNonmax(output, 1);

end

