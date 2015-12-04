function output = dlt(x,xp)

% x and xp is a matrix containing the corresponding points (first row: u
% values, second row: v values, see slides)
% (in other words: every column is a point)

%% normalize points using U and T (centroid origin, average dist. sqrt(2))

% TODO: Put x and xp in homogenous coordinates

U = normalizationMatrix(x);
T = normalizationMatrix(xp);

% TODO: look at this transformation
x_norm = U * x;
xp_norm = T * x;
end