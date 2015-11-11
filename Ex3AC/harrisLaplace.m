function [ listCorners ] = harrisLaplace( image, n, s0, k, alpha, th, tl )
%HARRISLAPLACE Summary of this function goes here
%   Detailed explanation goes here


    F = zeros(size(image,1),size(image,2), n);

    for j = 1:n

        sigma_In = k^j*s0;

        gaussSigma_In = fspecial('Gaussian', round(3*sigma_In), sigma_In);
        gaussed = conv2(image,gaussSigma_In, 'same');

        laplaceFilter = [0,1,0;1,-4,1;0,1,0];

        laplaced = conv2(gaussed, laplaceFilter, 'same');

        F(:,:,j) = abs(laplaced.*(sigma_In^2));

    end

    [output, list] = harris(image, n, s0, k, alpha, th);
    listCorners = zeros(0,4);
    
    for i = 1:size(list, 1)
        row = list(i,1);
        col = list(i,2);
        scale = list(i,3);
       
        
        if F(row, col, scale) > tl
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

