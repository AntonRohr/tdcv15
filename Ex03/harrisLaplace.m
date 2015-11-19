function output = harrisLaplace( input, level, s0, step, alpha, t_h, t_l )
%HARRISLAPLACE returns the scale-space harris-laplace filtered image
%   Finds corners reallll good yo. 

input = double(input);
[row,col] = size(input);
output = zeros(row,col,level);

harris = zeros(row,col);
laplace = harris;
for i = 1 : level
    sigma_i = step^i * s0;
    sigma_d = 0.7 * sigma_i;
    
    %get our candidate points for this scale
    harris = harrisFilter(input, sigma_i, sigma_d, alpha, t_h);
    
    %get our laplacian for this scale
    laplace = laplacianFilter(input, sigma_i, sigma_d, t_l);
    
    for c = 1 : col
        for r = 1 : row
            %For each candidate point
            if(harris(r,c) ~= 0)
                %Return the laplacian response
                output(r,c,i) = laplace(r,c);
            end
        end
    end
    
end

%do 3-D nonmaximum suppression over the entire output

output = suppressNonmax3D(output, 1);

end

