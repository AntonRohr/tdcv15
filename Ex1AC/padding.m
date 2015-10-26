function Ipad = padding(inputImage, padM, padN, type)

[x,y] = size(inputImage);

padM = floor(padM/2);
padN = floor(padN/2);

Ipad = zeros(x+padM*2, y+padN*2);

Ipad(padM+1:end-padM,padN+1:end-padN) = inputImage;

if strcmp(type, 'clamp')
    %left
    Ipad(1+padM:end-padM,1:padN) = repmat(Ipad(padM+1:end-padM,padN+1),1,padN);
    %right
    Ipad(1+padM:end-padM,end-padN+1:end) = repmat(Ipad(1+padM:end-padM,end-padN),1,padN);
    %up
    Ipad(1:padM,1+padN:end-padN) = repmat(Ipad(1+padM,1+padN:end-padN),padM,1);
    %down
    Ipad(end-padM+1:end,1+padN:end-padN) = repmat(Ipad(end-padM, 1+padN:end-padN),padM,1);
    
    %%corners
    %upperleft corner
    Ipad(1:padM,1:padN) = Ipad(1+padM, 1+padN);
    %bottomleft
    Ipad(end-padM+1:end, 1:padN) = Ipad(end-padM,1+padN);
    %upperright
    Ipad(1:padM,end-padN+1:end) = Ipad(1+padM,end-padN);
    %bottomright
    Ipad(end-padM+1:end, end-padN+1:end) = Ipad(end-padM,end-padN);
    
    
end

if strcmp(type, 'mirror')
    
    %left 
    % - left part of the assignment is the same as above
    % - right part is flipped (fliplr = flip left right)
    % -- area to flip is now a matrix, instead of a copied vector (above) 
    Ipad(1+padM:end-padM,1:padN) = fliplr(Ipad(padM+1:end-padM, padN+1:2*padN));
    %right
    Ipad(1+padM:end-padM,end-padN+1:end) = fliplr(Ipad(1+padM:end-padM,end-2*padN+1:end-padN));
    %up
    Ipad(1:padM,1+padN:end-padN) = flipud(Ipad(padM+1:2*padM,1+padN:end-padN));
    %down 
    Ipad(end-padM+1:end,1+padN:end-padN) = flipud(Ipad(end-2*padM+1:end-padM,1+padN:end-padN));
    %%corners
    %upperleft corener
    % - again left part is the same as above
    % - right part is a 180° turned martix
    % - rot90(A,k) turn A counter clockwise k times 90° (k=2 => 180°)
    Ipad(1:padM,1:padN) = rot90(Ipad(padM+1:2*padM, padN+1:2*padN),2);
    %bottomleft
    Ipad(end-padM+1:end, 1:padN) = rot90(Ipad(end-2*padM+1:end-padM, padN+1:2*padN),2);
    %upperright
    Ipad(1:padM,end-padN+1:end) = rot90(Ipad(padM+1:2*padM, end-2*padN+1: end-padN),2);
    %bottomright
    Ipad(end-padM+1:end, end-padN+1:end) = rot90(Ipad(end-2*padM+1:end-padM, end-2*padN+1: end-padN),2);
    
end