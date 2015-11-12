function output = suppressNonmax3D( input, patch )
%SUPPRESSNONMAX3D Performs non-maximal suppression in 3D

output = zeros(size(input));
%Need to pad the input
padded_input = zeros(2*patch+size(input,1),2*patch+size(input,2),2*patch+size(input,3));
padded_input(patch+1:end-patch,patch+1:end-patch,patch+1:end-patch) = input;

for scale = 1:size(output,3)
    for row = 1:size(output,1)
        for col = 1:size(output,2)
            %offset coords into input image
            i = col + patch;
            j = row + patch;
            k = scale + patch;
            
            candidate = padded_input(j,i,k);
            %Consider only candidate points
            if(candidate ~= 0)
                if(candidate == max(max(max(padded_input(j-patch:j+patch, i-patch:i+patch, k-patch:k+patch)))))
                    output(row,col,scale) = padded_input(j,i,k);
                end
            end
        end
    end
end

end

