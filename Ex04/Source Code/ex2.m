im_test1 = imread('test_pot1.jpg');
im_test2 = imread('test_pot2.jpg');
im_pot = imread('pot.jpg');

im_test1 =  imresize(im_test1, 0.25);
im_test2 =  imresize(im_test2, 0.25);
im_pot = imresize(im_pot, 0.125);

im_test3 = imread('test_shell1.jpg');
im_test4 = imread('test_shell2.jpg');
im_shell = imread('shell.jpg');

im_test3 =  imresize(im_test3, 0.25);
im_test4 =  imresize(im_test4, 0.25);
im_shell = imresize(im_shell, 0.125);

result1 = multiHog(im_test1, im_pot, 0.9, 4, 8);
result2 = multiHog(im_test2, im_pot, 0.9, 4, 8);
result3 = multiHog(im_test3, im_shell, 0.9, 4, 8);
result4 = multiHog(im_test4, im_shell, 0.9, 4, 8);

drawRectangle(im_test1, result1);
drawRectangle(im_test2, result2);
drawRectangle(im_test3, result3);
drawRectangle(im_test4, result4);