im_test1 = imread('test_pot1.jpg');
im_test2 = imread('test_pot2.jpg');
im_pot = imread('pot.jpg');

im_test1 =  imresize(im_test1, 0.25);
im_test2 =  imresize(im_test2, 0.25);
im_pot = imresize(im_pot, 0.125);

result1 = multiHog(im_test1, im_pot, 0.9, 4, 8);
result2 = multiHog(im_test2, im_pot, 0.9, 4, 8);

drawRectangle(im_test1, result1);
drawRectangle(im_test2, result2);