function outputImage = convFilter(inputImage, mask, type)

%get  mask size
[M,N] = size(mask);

deltaM = floor(M/2);
deltaN = floor(N/2);

%get image size
[rows,cols] = size(inputImage);

%do padding
paddedImage = padding(inputImage, deltaM, deltaN, type);

%create empty output Image with size of paddedImage
outputImage = zeros(size(inputImage));

%normalize
mask = normalize(mask);

%iterate over
for x = 1:rows
   for y = 1:cols
       %scalar wise multiple the mask with the underlying paddedimage
       temp = mask.*paddedImage(x:x+M-1,y:y+N-1);
       % then sum it up and the value is 
       outputImage(x,y) = sum(sum(temp));
   end
end



