function output = filter2d(input, mask, border_treatment)
[y_size, x_size] = size(mask);


%Initialize the output
output = zeros(size(input));

%Do padding
padded_image = pad(input, mask, border_treatment);

%Do convolution
%Each pixel in the output is the convolution of pixels in the padded image
%with the filter mask.
for i = 1:size(output,2)
    for j = 1:size(output,1)
        filter_area = padded_image(j:j+y_size-1,i:i+x_size-1);
        output(j,i) = sum(sum(filter_area.*mask));
    end
end
