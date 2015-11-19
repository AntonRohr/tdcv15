function output = bilateralMask( matrix, sigmar )
[x_size, y_size] = size(matrix);
x_middle = ceil(x_size/2);
y_middle = ceil(y_size/2);
middle_value = matrix(x_middle, y_middle);
output = double(ones(size(matrix)));


for i = 1 : x_size
    for j = 1 : y_size
        %temp_matrix = ones(size(matrix));
        %temp_matrix(i, j) = exp(-1 / 2 * ((matrix(i, j) - middle_value)/sigma)^2);
        output(i, j) = exp(-1/2*((matrix(i, j) - middle_value)/sigmar).^2);
    end
end

end

