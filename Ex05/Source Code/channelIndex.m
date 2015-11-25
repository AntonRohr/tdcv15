function channel = channelIndex( z )
%CHANNELINDEX Turns an index in the tree into the channel index.
%   0 = B, 1 = G, 2 = R, 3 = R. Why? No one knows. 

switch z
    case 0
        channel = 3;
    case 1
        channel = 2;
    case 2 
        channel = 1;
    case 3
        channel = 1;
    otherwise
        error('Invalid channel index!')
end
     
end

