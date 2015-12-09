function output_image  = medianFilter( input_image, n )
%medianFilter Applies an n by n median filter 
%   We sort each filter mask as an array, then apply it to the reference
%   pixel. 

    %Pad the image with clamped padding (makes the most sense for median).
    padX = floor(n/2); padY = floor(n/2);
    padded_image = pad(input_image, padY, padX, 'clamp');

    output_image = zeros(size(input_image));

    %Perform filtering over the padded image
    for i = 1:size(output_image,2)
        for j = 1:size(output_image,1)
            output_image(j,i) = median2d(padded_image(j:j+n-1,i:i+n-1));
        end
    end
end

