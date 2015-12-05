function H = dlt(x,xp)

% x and xp is a matrix containing the corresponding points 
% (in other words: every column is a point)

%% normalize points using U and T (centroid origin, average dist. sqrt(2))

% Put x and xp in homogenous coordinates
x = [ x ; ones(1,size(x,2)) ]
xp = [xp ; ones(1,size(xp,2)) ]

U = normalizationMatrix(x);
T = normalizationMatrix(xp);

% Transform the vectors with their transformation matrix
x_norm = U * x;
xp_norm = T * x;


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
    A_i = [0, 0, 0,  (-wp_i*x_norm') , (yp_i*x_norm') ; (w_i*x_norm'),  0, 0, 0,  (-xp_i*x_norm')]
    
    % accumulate in A
    A = [A ; A_i];
end

% compute SVD of A (don't know how to use this for solving the equation
% yet)
% S == U, but this is already taken. consider renaming U above if we need S
[S,D,V] = svd(A);


end