function output = harrisFilter( input, sigma_i, sigma_d, alpha )
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
d_smoothed_image = conv2(input, gaussian_d, 'same');

%first derivatives
image_x = conv2(d_smoothed_image, d_x,'same');
image_y = conv2(d_smoothed_image, d_y,'same');

%second moments
image_x_y = image_x.*image_y;
image_x_x = image_x.^2;
image_y_y = image_y.^2;

%smoothed second moments
image_x_y = conv2(image_x_y, gaussian_i, 'same');
image_x_x = conv2(image_x_x, gaussian_i, 'same');
image_y_y = conv2(image_y_y, gaussian_i, 'same');

for i = 1:size(output,2)
    for j = 1:size(output,1)
            second_moment_matrix = [image_x_x(j,i),image_x_y(j,i);image_x_y(j,i),image_y_y(j,i)];
            M = (sigma_d^2) * second_moment_matrix;
            re = harris_response(M, alpha);
            if re>0
                output(j,i) = re;
            end
    end
end

