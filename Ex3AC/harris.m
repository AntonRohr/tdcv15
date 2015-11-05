function [ outputImage ] = harris( image, n, s0, k, alpha, t )

outputImage = zeros(size(image));

%halfN 



dx = [-1,0,1;-1,0,1;-1,0,1];
dy = [-1,-1,-1;0,0,0;1,1,1];

gaussianMask = fspecial('Gaussian', [5,5], 1);

dxGau = conv2(gaussianMask, dx)
dyGau = conv2(gaussianMask, dy);

Lx = conv2(image, dxGau, 'same');
Ly = conv2(image, dyGau, 'same');

Lx2 = Lx.^2;
Ly2 = Ly.^2;
Lxy = Lx.*Ly;


for x = 1:size(image,1)
    for y = 1:size(image, 2)
    
        mat = [Lx2(x,y), Lxy(x,y); Lxy(x,y), Ly2(x,y)]; 
    
    end
end

end

