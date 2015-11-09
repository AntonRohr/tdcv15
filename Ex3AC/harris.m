function [ outputImage, list ] = harris( image, n, s0, k, alpha, t )

outputImage = zeros(size(image));

dx = [-1,0,1;-1,0,1;-1,0,1];
dy = [-1,-1,-1;0,0,0;1,1,1];

for j = 1:n
    sigma_I = j*k*s0;
   
    gaussianMask = fspecial('Gaussian', [5,5], sigma_I);
    

    dxGau = conv2(gaussianMask, dx);
    dyGau = conv2(gaussianMask, dy);

    Lx = conv2(image, dxGau, 'same');
    Ly = conv2(image, dyGau, 'same');

    % elements of the matrix M
    Lx2 = Lx.^2;
    Ly2 = Ly.^2;
    Lxy = Lx.*Ly;

    % convolve elements of M again with a gaussian mask
    Lx2 = conv2(Lx2, gaussianMask, 'same'); 
    Ly2 = conv2(Ly2, gaussianMask, 'same');
    Lxy = conv2(Lxy, gaussianMask, 'same');

    for x = 1:size(image,1)
        for y = 1:size(image, 2)

            mat = [Lx2(x,y), Lxy(x,y); Lxy(x,y), Ly2(x,y)];

            %mat = conv2(mat, gaussianMask, 'same');

            R = det(mat) - alpha * (trace(mat) ^ 2);

        if (R > t && outputImage(x,y) < R)
             outputImage(x, y) = R; 
        end

        end
    end

end

tmp = nmsFilter(outputImage, 10, 10);

[r,c] = find(tmp);
list = [c,r];
    
end

