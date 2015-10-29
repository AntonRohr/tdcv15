image = im2double(imread('lena.gif'));

%output = medianFilter(image, 2, 21);

salted = generateNoise(image, 'salt', 1000);

gaussed = generateNoise(image, 'gaussian', 30)

output = medianFilter(gaussed, 3,3);

%imshowpair(gaussed, image, 'diff');
imshow(output);

%imshowpair(image,output, 'diff');