% imageSeq = readImages();



    


referenceImg = imageSeq{1};
%currentImg = imwarp(imageSeq{2}, projective2d([1,0,0;0,1,0;0,-30,1]), 'OutputView', imref2d(size(referenceImg)));
%currentImg = imageSeq{2};
%imshowpair(referenceImg, currentImg, 'montage');
mu = mu_r;

muDraw = reshape(mu,2,4)';
drawedRef = drawCorners(imageSeq{1}, [muDraw(:,2), muDraw(:,1)], 'circle');

for k = 2:size(imageSeq, 1)
    currentImg = imageSeq{k};
    
    for j = size(A,3):-1:1    
    %for j = 1
        for i = 1:5     

            imgIntensities = computeDeltaI(currentImg, mu_r, mu, gridPoints);
            normalizedImgIntensities = normalize(imgIntensities);

            delta_i = normalizedImgIntensities - originalNormalizedIntensities;

            delta_p = A(:,:,j) * delta_i;

            %current Hc
            %Hc = computeHomography(mu_r, mu);

            %current Homography Hu
            %Hu = computeHomography(mu_r, mu_r+delta_p); % might be mu
            %disp();

            % compute new homography Hn 
            Hn = computeHomography(mu_r,mu+delta_p);

            %compute new parameterVector for next iteration
            mu = transformPoints(Hn, mu_r);

        end
    end
    k
    mu
    muDraw = reshape(mu,2,4)';
    drawed = drawCorners(currentImg, [muDraw(:,2), muDraw(:,1)], 'circle');
    imshowpair(drawedRef, drawed, 'montage');
    imwrite(drawed,['result/img_', sprintf('%03d',k), '.png']);
    %disp();
end

