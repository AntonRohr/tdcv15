function output = filter2d(input, mask, border_treatment)
[y_size, x_size] = size(mask);
pad_y = floor(y_size / 2);
pad_x = floor(x_size / 2);


%Initialize the output
output = uint8(zeros(size(input)));

%Do padding
padded_image = pad(input, pad_y, pad_x, border_treatment);

%Do convolution
%Each pixel in the output is the convolution of pixels in the padded image
%with the filter mask.
for i = 1:size(output,2)
    for j = 1:size(output,1)
        filter_area = double(padded_image(j:j+y_size-1,i:i+x_size-1));
        output(j,i) = uint8(sum(sum(filter_area.*mask)));
    end
end
