function gaussian = gaussian2D( sigma )
%GAUSSIAN2D returns a 2D gaussian kernel scaled by sigma
%   Size is 3 sigma. Sigma should be odd.

gaussian = fspecial('gaussian', 3*ceil(sigma), sigma);


end

