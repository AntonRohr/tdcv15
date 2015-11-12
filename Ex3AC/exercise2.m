imageTunnel = im2double(imread('checkerboard_tunnel.png'));
imageTest = im2double(imread('test.pgm'));
imageHouse = im2double(imread('house.png'));
imageLena = im2double(imread('lena.gif'));
imageSample2 = im2double(rgb2gray(imread('sample2.jpg')));
imageCheckerboard = checkerboard(50);

n = 5;
s0 = 1;
k = 1.4;
alpha = 0.05;

list = harrisLaplace(imageTunnel, n, s0, k, alpha, 0.01, 0.003);
drawnTunnel = drawCorners(imageTunnel, list, 'rectangle');

list = harrisLaplace(imageTest, 3, s0, k, 0.05, 0.0001, 0);
drawnTest = drawCorners(imageTest, list, 'rectangle');

list = harrisLaplace(imageHouse, n, s0, k, alpha, 0.03, 0.0003);
drawnHouse = drawCorners(imageHouse, list, 'rectangle');

%list = harrisLaplace(imageLena, n, s0, k, alpha, 0.005, 0.003);
%drawnLena = drawCorners(imageLena, list, 'rectangle');

list = harrisLaplace(imageSample2, n, s0, k, alpha, 0.01, 0.003);
drawnSample2 = drawCorners(imageSample2, list, 'rectangle');

%list = harrisLaplace(imageCheckerboard, n, s0, k, alpha, 0.01, 0.003);
%drawnCheckerboard = drawCorners(imageCheckerboard, list, 'rectangle');


subplot(2,2,1);
imshow(drawnTunnel);
subplot(2,2,2);
imshow(drawnTest);
subplot(2,2,3);
imshow(drawnHouse);
subplot(2,2,4);
imshow(drawnSample2);