% imageSeq = readImages();


for i = 2:size(imageSeq, 1)
    
end

referenceImg = imageSeq{1};
currentImg = imageSeq{2};

mu = mu_r;

%for j = size(A,3):-1:1    
 for j = 1
    for i = 1:5     
        
        imgIntensities = computeDeltaI(currentImg, mu_r, mu, gridPoints);
        normalizedImgIntensities = normalize(imgIntensities);

        delta_i = normalizedImgIntensities - originalNormalizedIntensities;

        delta_p = A(:,:,j) * delta_i

        %current Hc
        Hc = computeHomography(mu_r, mu);

        %current Homography Hu
        Hu = computeHomography(mu_r, mu_r+delta_p); % might be mu
        %disp();

        % compute new homography Hn
        Hn = computeHomography(mu_r,mu+delta_p);

        %compute new parameterVector for next iteration
        mu = transformPoints(Hn, mu);
    
    end
    

end

