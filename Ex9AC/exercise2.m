%imageSeq = readImages();


for i = 2:size(imageSeq, 1)
    
end


img = imageSeq{1};

for j = size(A,3):-1:1
   
    imgIntensities = zeros(size(gridPoints, 1),1);
    for k = 1:size(imgIntensities,1)
        col = gridPoints(k,2);
        row = gridPoints(k,1);
        imgIntensities(k) = img(row,col);
    end
    normalizedImgIntensities = normalize(imgIntensities);

    delta_i = normalizedImgIntensities - originalNormalizedIntensities;
    
    delta_p = A(:,:,j) * delta_i;
    
    %current Homography Hc
    tform = computeHomography(mu_r, delta_p);
    %disp();

end

