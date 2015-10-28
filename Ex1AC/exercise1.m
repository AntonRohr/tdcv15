%read image and convert to double type. 
image = im2double(imread('lena.gif'));


aClamp = padding(image, 100, 100, 'clamp');

aMirror = padding(image, 100, 100, 'mirror');

mask = ones(3,3);
b = convFilter(image,mask,'mirror'); 



