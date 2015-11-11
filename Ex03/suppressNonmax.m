function  output = suppressNonmax( input, patch_size )
%SUPPRESSNONMAX set nonmaximal values in the neighborhood to zero

output = zeros(size(input));

%Need to pad the input
padded_input = zeros(2*patch_size+size(input,2),2*patch_size+size(input,1));

%The interior of the padded image is simply the input image
padded_input(patch_size+1:end-patch_size,patch_size+1:end-patch_size) = input;

for col = 1:size(output,2)
    for row = 1:size(output,1)
        %offset coordinates into the patched image
        i = col + patch_size;
        j = row + patch_size;
        if (padded_input(j,i)) == max(max(padded_input((j-patch_size:j+patch_size),(i-patch_size):(i+patch_size))))
            output(row, col) = input(row,col);
        end
    end
end

end

