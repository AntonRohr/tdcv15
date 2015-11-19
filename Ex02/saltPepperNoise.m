function output  = saltPepperNoise( input_image, density )
%saltPepperNoise adds 'Salt and Pepper' noise to an image, pegging some
%pixels at white, and some at black, randomly. 

if density > 1 || density < 0
    error('Intensity must be between 0 and 1');
end

%Initialize the output
output = uint8(zeros(size(input_image)));

max_intensity = max(max(input_image));
min_intensity = min(min(input_image));
    
for i = 1:size(output,2)
    for j = 1:size(output,1)
        r = rand();
        %Don't add noise
        if r > density
            output(j,i) = input_image(j,i);
        %Add 'salt'
        elseif r < density/2
            output(j,i) = max_intensity;
        else
        %Add 'pepper'
            output(j,i) = min_intensity;
        end
    end
end
    
    
    

    
    


end

