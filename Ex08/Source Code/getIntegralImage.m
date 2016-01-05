function integral_image = getIntegralImage( input_image )
%INTEGRALIMAGE computes the integral image of the given input. 

input_image = double(input_image);
input_size = size(input_image);
integral_image = zeros(input_size);

integral_image(1,1) = input_image(1,1);

%Set the first row correctly
    for i = 2:input_size(2)
        integral_image(1,i) = input_image(1,i) + integral_image(1,i-1);
    end

%Set the rest
    for j = 2:input_size(1)
        for i = 1:input_size(2)
            if (i == 1)
                integral_image(j, i) = input_image(j,i) + integral_image(j-1,i); 
            else
                integral_image(j, i) = input_image(j,i) + integral_image(j,i-1) + ...
                integral_image(j-1,i) - integral_image(j-1,i-1);
            end
        end
    end
end

