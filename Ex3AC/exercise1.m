image = im2double(imread('checkerboard_tunnel.png'));

n = 3; 
s0 = 1;
k = 1.4;
alpha = 0.05;
t = 0;

output = harris(image, n, s0, k, alpha, t);

imshowpair(image,output,'diff');
%imagesc(output); colormap gray;
%imshow(output);