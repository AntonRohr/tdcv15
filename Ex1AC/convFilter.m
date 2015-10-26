function I = convFilter(inputImage, mask, type)

%get  mask size
[M,N] = size(mask);



I = padding(inputImage, M, N, type);