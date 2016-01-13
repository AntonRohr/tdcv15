function normalized_image = normalizeImage( input_image )
%NORMALIZEIMAGE normalizes the intensity and variance of an image, and adds
%noise

normalized_image = (input_image - mean(input_image(:)))/std2(input_image(:));
normalized_image = normalized_image + 0.1*randn(size(normalized_image))-0.05;
end

