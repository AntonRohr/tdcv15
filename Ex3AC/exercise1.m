image = im2double(imread('checkerboard_tunnel.png'));
%image = im2double(imread('test.pgm'));

n = 3; 
s0 = 1;
k = 1.4;
alpha = 0.05;
t = 0;

[output, list] = harris(image, n, s0, k, alpha, t);

drawn = drawRects(image, list);

%mesh(output);
imshowpair(drawn,output,'montage');
%imagesc(output); colormap gray;
%imshow(output);