I = imread('lena.gif');
I = im2double(I);
A1 = bilateralFilter(I, 1, 0.1, 'mirror');
B1 = bilateralFilter(I, 5, 0.1, 'mirror');
C1 = bilateralFilter(I, 10, 0.1, 'mirror');
figure;
subplot(2,2,1); imagesc(I); title('Original');
subplot(2,2,2); imagesc(A1); title('sigma = 1; sigma_r = 0.1');
subplot(2,2,3); imagesc(B1); title('sigma = 5; sigma_r = 0.1');
subplot(2,2,4); imagesc(C1); title('sigma = 10; sigma_r = 0.1');
colormap gray;

figure;
gaussian_mask1 = gaussianKernel2d(1);
gaussian_mask5 = gaussianKernel2d(5);
gaussian_mask10 = gaussianKernel2d(10);
I = imread('lena.gif');
A2 = filter2d(I, gaussian_mask1, 'mirror');
B2 = filter2d(I, gaussian_mask5, 'mirror');
C2 = filter2d(I, gaussian_mask10, 'mirror');
subplot(3,2,1); imagesc(A1); title('Bilateral');
subplot(3,2,2); imagesc(A2); title('Gaussian');
subplot(3,2,3); imagesc(B1); 
subplot(3,2,4); imagesc(B2); 
subplot(3,2,5); imagesc(C1);
subplot(3,2,6); imagesc(C2);

colormap gray;