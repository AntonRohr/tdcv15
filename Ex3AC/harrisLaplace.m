function [ listCorners ] = harrisLaplace( image, n, s0, k, alpha, th, tl )
%HARRISLAPLACE Summary of this function goes here
%   Detailed explanation goes here

    % create F matrix for Laplacian
    F = zeros(size(image,1),size(image,2), n);

    % fill F
    for j = 1:n

        % define sigma_In for current scale level
        sigma_In = k^j*s0;

        % create mask and convolute input image
        gaussSigma_In = fspecial('Gaussian', round(3*sigma_In), sigma_In);
        gaussed = conv2(image,gaussSigma_In, 'same');

        % sum of the second derivatives of the input image
        laplaceFilter = [0,1,0;1,-4,1;0,1,0];

        % convolute gaussedImage with second derivatives
        laplaced = conv2(gaussed, laplaceFilter, 'same');

        % define matrix entries for different scale levels j
        F(:,:,j) = abs(laplaced.*(sigma_In^2));

    end

    % run multi-scale harris corner detector
    [output, list] = harris(image, n, s0, k, alpha, th);
    listCorners = zeros(0,4);
    
    % Filter each corner point to find the correct scale
    for i = 1:size(list, 1)
        row = list(i,1);
        col = list(i,2);
        scale = list(i,3);
       
        % check if the current point in the list is a candidate and
        % check if it is a scale maximum regarding the "nearest" scales
        if F(row, col, scale) > tl && n > 1
            if (scale==1)
                if F(row, col, scale) > F(row,col, scale+1)
                    listCorners(end+1,:) = list(i,:);
                end
            elseif (scale==n)
                if F(row, col, scale) > F(row,col, scale-1)
                    listCorners(end+1,:) = list(i,:);
                end
            else
                if F(row,col,scale) > F(row,col,scale-1) && F(row,col,scale) > F(row,col,scale-1)
                    listCorners(end+1,:) = list(i,:);
                end
            end
        end
        
        
        
    end

end

