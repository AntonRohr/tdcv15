%image = im2double(imread('checkerboard_tunnel.png'));
%image = im2double(imread('test.pgm'));
%image = im2double(imread('house.png'));
%image = im2double(imread('lena.gif'));
%image = im2double(rgb2gray(imread('sample2.jpg')));
image = checkerboard(50);

%dxx = [1, -2, 1];
%dyy = dxx';
%Lxx = conv2(image, dxx, 'same');
%Lyy = conv2(image, dyy, 'same');

n = 7;
s0 = 1;
k = 1.4;
alpha = 0.05;
th = 0.0005;
tl = 0.1;

list = harrisLaplace(image, n, s0, k, alpha, th, tl);

list = [list(:,2) list(:,1) list(:,4).*2];

drawn = drawCorners2(image, list);
imshow(drawn);