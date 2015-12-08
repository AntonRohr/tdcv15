function projected = reproject( H, original )
%REPROJECT applies the transform to homogeneous coordinates, then converts
%back

homo_original = [original;ones(1, size(original,2))];

homo_projected = H*homo_original;
projected = zeroes(2,size(homo_original,2));

%Wish I knew how to do this vectorised 
for i = 1:size(homo_projected,2)
    projected(1,i) = homo_projected(1,i)/homo_projected(3,i);
    projected(2,i) = homo_projected(2,i)/homo_projected(3,i);
end

end