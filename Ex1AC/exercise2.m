%read image and convert to double type. 
image = im2double(imread('lena.gif'));

    %--Part (a)
    
% 2D-Filter with sigma = 1
sigma = 1;
a1 = convFilter(image, gaussian2dMask(3*sigma,3*sigma,sigma), 'mirror');

subplot(3,2,1);
imshow(a1);
title('Sigma 1, 2D Filter');

% 2D-Filter with sigma = 3
tic
sigma = 3;
a2 = convFilter(image, gaussian2dMask(3*sigma,3*sigma,sigma), 'mirror');
toc
   
subplot(3,2,2);
imshow(a2);
title('sigma 3, 2D Filter');

    %-- Part (b)
    
% temp: apply vertical filter to image
% b1: apply horizontal filter to image (filtered by vertical)
% sigma = 1
sigma = 1;
temp = convFilter(image, gaussian2dMask(3*sigma, 1, sigma), 'mirror');
b1 = convFilter(temp, gaussian2dMask(1, 3*sigma, sigma), 'mirror');

subplot(3,2,3);
imshow(b1);
title('Sigma 1, separated filter');

% same with sigma = 3
tic
sigma = 3;
temp = convFilter(image, gaussian2dMask(3*sigma, 1, sigma), 'mirror');
b2 = convFilter(temp, gaussian2dMask(1, 3*sigma, sigma), 'mirror');
toc

subplot(3,2,4);
imshow(b2);
title('Sigma 3, separated filter');

subplot(3,2,5);
imshowpair(a1,b1,'diff');
title('Difference sigma 1');

subplot(3,2,6);
imshowpair(a2,b2,'diff');
title('Difference sigma 3');


% Sum of squared errors
sumErrors1 = sum(sum((a1-b1).^2))
sumErrors2 = sum(sum((a2-b2).^2))



