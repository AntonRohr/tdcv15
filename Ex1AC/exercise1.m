%read image and convert to double type. 
image = im2double(imread('lena.gif'));


aClamp = padding(image, 100, 100, 'clamp');

aMirror = padding(image, 100, 100, 'mirror');

mask = ones(3,3);
b = convFilter(image,mask,'mirror');

%show results
subplot(3, 2, 1);
imshow(image);
title('Original');

subplot(3, 2, 2);
imshow(aClamp);
title('Clamp');

subplot(3, 2, 3);
imshow(aMirror);
title('Mirror');

subplot(3, 2, 4);
imshow(b);
title('Applied Convolution')

subplot(3,2,5);
imshowpair(b,image,'diff');
title('Difference between filtered image and original');