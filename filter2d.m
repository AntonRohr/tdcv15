function output = filter2d(input, mask, border_treatment)

[M, N] = size(mask);
padX = floor(M/2); padY = floor(N/2);

%Initialize the output
output = zeros(size(input));

%Do padding
padded_image = pad(input, padX, padY, border_treatment);

%Do convolution
%Each pixel in the output is the convolution of pixels in the padded image
%with the filter mask.
for i = 1:size(output,1)
    for j = 1:size(output,2)
        filter_area = padded_image(i:i+N-1,j:j+M-1);
        output(i,j) = sum(sum(filter_area.*mask));
    end
end
