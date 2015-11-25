function [ tree, leaves ] = readTree( filename )
%READTREE Reads a tree from a formatted textfile
%   Returns a matrix representation, indexed by node/leaf i.d.

fileID = fopen(filename);

% Number of nodes is stored in the first line
node_count = str2double(fgetl(fileID));

% Initialize the tree matrix, nodes are represented by a vector of length
% 11. Note that indices in nodes start at zero, but matlab is 1-indexed.
% Leaves are negative-indexed. Don't forget the 1-index offset.
tree = zeros(node_count,11);

for n = 1:node_count
    node_vector = str2num(fgetl(fileID));
    tree(n,:) = node_vector;
end

% Number of leaves is stored in the next line
leaf_count = str2double(fgetl(fileID));

leaves = zeros(leaf_count,3);

for l = 1:leaf_count
    leaf_vector = str2num(fgetl(fileID));
    leaves(l,:) = leaf_vector;
end

% Done reading
fclose(fileID);

end

