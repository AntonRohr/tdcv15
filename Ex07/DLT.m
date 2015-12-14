function homography = DLT( image_points, warped_points )
%DLT Takes a set of point correspondences and computes a homography

%Compute the transform matrices
U = normalizingMatrix(image_points);
T = normalizingMatrix(warped_points);

%Translate point correspondences into homogeneous coordinates
homo_image_points = [image_points; ones(1,size(image_points,2))];
homo_warped_points = [warped_points; ones(1,size(warped_points,2))];

%Normalize the points
norm_image_points = zeros(size(homo_image_points));
norm_warped_points = zeros(size(homo_image_points));

for i = 1 : size(image_points, 2)
    norm_image_points(:,i) = U*homo_image_points(:,i);
    norm_warped_points(:,i) = T*homo_warped_points(:,i);
end

%Compute A
A = [];
for i = 1 : size(homo_image_points,2)
    A = [A;constraintMatrix(norm_image_points(:,i), norm_warped_points(:,i))];
end

%Decompose A by SVD
[M,S,V] = svd(A);

%We take the vector H as the last column in V. 
h = V(:,size(V,2));

%Reshape and transpose the vector. 
norm_H = reshape(h,3,3)';

%Calculate the homography by reversing the normalization transform.
homography = inv(T)*norm_H*U;


end

