image = im2double(imread('lena.gif'));

n = 3; 
s0 = 0;
k = 0;
alpha = 0;
t = 0;

output = harris(image, n, s0, k, alpha, t);

imshow(output);