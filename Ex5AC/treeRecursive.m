function [ leaf_id ] = treeRecursive ( currentPosition, node ) 

% node is only a data vector 
node_id = node(1);

cL = node(2);
cR = node(3);

t = node(4);

x0 = node(5);
y0 = node(6);
z0 = node(7);

x1 = node(8);
y1 = node(9);
z1 = node(10);

s = node(11);



%% here comes the main part ------
% these calculations are only made to determine 
% if we have to go left (cL) or right (cL) in the tree

% todo calculations with threshold t and the other values


box0Sum = getBoxSum(currentPosition(1)+x0, currentPosition(2)+y0, z0, s);

box1Sum = getBoxSum(currentPosition(1)+x1, currentPosition(2)+y1, z1, s);

if (box0Sum - box1Sum) < t
	next_id = cL;
else
	next_id = cR;
end




%% next step in algorithm

if next_id < 1
	leaf_id = abs(next_id);
else
	% plus one offset is here needed because node indexes begin with 0
	nextNode = treeMatrix(node_id+1, :);
	leaf_id = treeRecursive(currentPosition, nextNode);
end






end