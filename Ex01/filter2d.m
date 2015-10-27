function output =filter2d(image, mask, border)
[M, N] = size(mask);
%Initialize the output
output = zeros(size(image));

%Do padding
padded_image = pad(image,mask,border);
%imagesc(padded_image);
%Do convolution
%Each pixel in the output is the convolution of pixels in the padded image
%with the filter mask.
a = 1;

for j = 1:(size(padded_image,2) - N + 1 )
    for i = 1:(size(padded_image,1) - M + 1);
        filter_area = padded_image(i:i+M-1,j:j+N-1);
        output(a) = fix(sum(sum(filter_area.*mask)));
        a = a+1;
    end    
end

