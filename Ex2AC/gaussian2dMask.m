function [ mask ] = gaussian2dMask( sizeM, sizeN, sigma )

mask = zeros(sizeM, sizeN);

midM = floor(sizeM/2);
midN = floor(sizeN/2);

for x = 1:sizeM
    for y = 1:sizeN
        mask(x,y) = gaussian2d(x-midM-1, y-midN-1, sigma);
    end
end
%mesh(mask);
%plot(mask);
%sum(sum(mask))
end

