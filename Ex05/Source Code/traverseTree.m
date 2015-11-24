function leaf = traverseTree( integral_image, x, y, tree, leaves)
%TRAVERSETREE Traverses the given tree, starting at the root and ending at
%a leaf. Returns the leaf that was reached. 
%   Performs testing at each node, until a leaf is reached. 
%   Iterative to reduce function call overhead and exploit memory locality.

%   Note: nodes and leaves are 0 indexed. 
%   Note: in the tree nodes,, channels are:
%    0:B 1:G 2:R 3:R   :'((((((

%Start at the root.
node_id = 0;

%Keep going until we fall off the tree
while(node_id + 1 <= size(tree,1))
    %Retreive the node
    node = tree(node_id + 1,:); %MATLAB is 1 indexed, node id's are zero indexed

    %Unpack variables from the vector
    cL = node(2); cR = node(3);
    t = node(4); 
    x0 = node(5); y0 = node(6); z0 = node(7);
    x1 = node(8); y1 = node(9); z1 = node(10);
    s = node(11);

    %Get the real channel from the channel index
    c0 = channelIndex(z0);
    c1 = channelIndex(z1);

    test = (boxSum(integral_image, x+x0, y+y0, s, c0) - boxSum(integral_image, x+x1, y+y1, s, c1)) < t;

    if (test)
        node_id = cL;
    else
        node_id = cR;
    end

    %If we're looking at a leaf, just return it and we're done. 
    if(node_id < 1)
        leaf = leaves((-node_id) +1, :);
        return;
    end

end

error('Fell out of the tree!');

end

