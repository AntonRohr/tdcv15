function [ delta_mu, delta_i ] = createWarpedIntensities( img, mu_r, gridCoordinates, randDisplacement )
%CREATEWARPEDINTENSITIES Summary of this function goes here
%   Detailed explanation goes here

delta_mu = zeros(size(mu_r));
for i = 1:size(mu_r,1)
	delta_mu(i) = randi(2*randDisplacement)-randDisplacement;
end


mu_rForHomography = reshape(mu_r,2,4)';

transformedPoints = reshape(mu_r+delta_mu,2,4)';

[tform] = estimateGeometricTransform(mu_rForHomography, transformedPoints, 'projective');

warpedImg = imwarp(img, tform.invert, 'OutputView', imref2d(size(img)));


delta_i = zeros(size(gridCoordinates,1), 1);

for i = 1:size(delta_i,1)
    col = gridCoordinates(i,2);
    row = gridCoordinates(i,1);
    delta_i(i) = warpedImg(row,col);
end


%warpedImg = drawCorners(warpedImg, [mu_rForHomography(:,2), mu_rForHomography(:,1)], 'circle');
%img = drawCorners(img, [transformedPoints(:,2), transformedPoints(:,1)], 'circle');



%imshowpair(img, warpedImg, 'montage');
%imshow(warpedImg);
%disp();

end

