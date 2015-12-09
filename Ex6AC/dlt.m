function H = dlt(x,xp)

% x and xp is a matrix containing the corresponding points 
% (in other words: every column is a point)

%% make sure there are 4 or more points

if size(x,2) < 4 || size (x,2) ~= size(xp,2)
    fprintf('Error: 4 or more points required');
    return;
end

%% normalize points using U and T (centroid origin, average dist. sqrt(2))

% Put x and xp in homogenous coordinates
x = [ x ; ones(1,size(x,2)) ];
xp = [xp ; ones(1,size(xp,2)) ];

U = normalizationMatrix(x);
T = normalizationMatrix(xp);

% Transform the vectors with their transformation matrix
x_norm = U * x;
xp_norm = T * xp;


%% Compute A_i

% initialize A as empty matrix
A = [];

% iterate over all the points to compute the individual A_i
for i = 1:(size(x,2))
    % get the values from xp
    wp_i = xp_norm(3,i);
    yp_i = xp_norm(2,i);
    xp_i = xp_norm(1,i);
    
    % three zeros needed because we always insert 3x1 vectors when doing the
    % calculations
    A_i = [0, 0, 0,  (-wp_i*x_norm(:,i)') , (yp_i*x_norm(:,i)') ; (wp_i*x_norm(:,i)'),  0, 0, 0,  (-xp_i*x_norm(:,i)')];
    
    % accumulate in A
    A = [A ; A_i];
end

% compute SVD of A
[S,D,V] = svd(A);

% since last value is the smallest singular value, take last column of V
% (singular vectors)
 h = V(:,size(V,2));
 
% use reshape to obtain 3x3 matrix
 H = reshape( h, 3, 3 )';

% compute the denormalized homography matrix
 H = inv(T) * H * U;

end