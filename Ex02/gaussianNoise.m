function  output = gaussianNoise( input_image, intensity )
%gaussianNoise adds gaussian noise to the input image.
%   Adds some noise to each pixel, then normalizes the image.

mask = intensity*randn(size(input_image));
output = mask + double(input_image);

end

