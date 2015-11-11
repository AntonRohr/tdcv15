imageTunnel = im2double(imread('checkerboard_tunnel.png'));
imageTest = im2double(imread('test.pgm'));
imageHouse = im2double(imread('house.png'));
imageLena = im2double(imread('lena.gif'));
imageSample2 = im2double(rgb2gray(imread('sample2.jpg')));
imageCheckerboard = checkerboard(50);

% define default values for the parameters
n = 5; 
s0 = 1;
k = 1.4;
alpha = 0.05;


[output, list] = harris(imageTunnel, n, s0, k, alpha, 0.01);
drawnTunnel = drawCorners2(imageTunnel, list);
%[output, list] = harris(imageTest, n, s0, k, alpha, 0.03);
%drawnTest = drawCorners2(imageTest, list);
%[output, list] = harris(imageHouse, n, s0, k, alpha, 0.03);
%drawnHouse = drawCorners2(imageTunnel, list);
%[output, list] = harris(imageLena, n, alpha, 0.03);
%drawnLena = drawCorners2(imageLena, list);
%[output, list] = harris(imageSample2, n, s0, k, alpha, 0.03);
%drawnSample = drawCorners2(imageSample2, list);
%[output, list] = harris(imageCheckerboard, n, s0, k, alpha, 0.03);
%drawnCheckerboard = drawCorners2(imageCheckerboard, list);



imshow(drawnTunnel);