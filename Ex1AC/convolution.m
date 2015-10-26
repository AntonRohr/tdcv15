%read image
image = im2double(imread('lena.gif'));

%create 3x3 mask
mask = ones(3,3);
%mask = [-1,-1,-1;0,0,0;1,1,1];

type = 'mirror';

outputImage = convFilter(image, mask, type);

imshow(outputImage);



