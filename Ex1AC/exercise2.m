%read image and convert to double type. 
image = im2double(imread('lena.gif'));


sigma = 1;
a1 = convFilter(image, gaussian2dMask(3*sigma,3*sigma,sigma), 'mirror');

tic
sigma = 3;
a2 = convFilter(image, gaussian2dMask(3*sigma,3*sigma,sigma), 'mirror');
toc


sigma = 1;
temp = convFilter(image, gaussian2dMask(3*sigma, 1, sigma), 'mirror');
b1 = convFilter(temp, gaussian2dMask(1, 3*sigma, sigma), 'mirror');

tic
sigma = 3;
temp = convFilter(image, gaussian2dMask(3*sigma, 1, sigma), 'mirror');
b2 = convFilter(temp, gaussian2dMask(1, 3*sigma, sigma), 'mirror');
toc


sumErrors1 = sum(sum((a1-b1).^2))
sumErrors2 = sum(sum((a2-b2).^2))



