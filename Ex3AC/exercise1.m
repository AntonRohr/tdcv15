imageTunnel = im2double(imread('checkerboard_tunnel.png'));
imageTest = im2double(imread('test.pgm'));
imageHouse = im2double(imread('house.png'));
imageLena = im2double(imread('lena.gif'));
imageSample2 = im2double(rgb2gray(imread('sample2.jpg')));


imageSmall = checkerboard(50);

% define default values for the parameters
n = 7; 
s0 = 1;
k = 1.4;
alpha = 0.05;
t = 0.0005;

%image = conv2(image, fspecial('Gaussian', 5, 1), 'same');


[output, list] = harris(imageSmall, n, s0, k, alpha, t);

list = [list(:,2) list(:,1) list(:,4).*2];
drawn = drawCorners2(image, list);
imshow(drawn);
%imshowpair(drawn, output, 'montage');


%mesh(output(:,:,1));
%hold on
%mesh(output(:,:,5));

%max(output(:))



%mesh(output);
%imshowpair(drawn,output,'montage');
%imagesc(output); colormap gray;
%imshow(output);


%--- test other files
%output = kp_harrislaplace(image);
%list = [output(:,2) output(:,1)];
%drawn = drawCorners(image, list, 'circle');
%imshow(drawn); 