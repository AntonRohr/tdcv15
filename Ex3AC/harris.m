function [ output, list ] = harris( image, n, s0, k, alpha, t )

    output = zeros(size(image));

    cornerDist = round(max(size(image)) / 100); %distancebetween to corners


    dx = [-1,0,1;-1,0,1;-1,0,1];
    dy = [-1,-1,-1;0,0,0;1,1,1];

    list = zeros(0,3);

    for j = 1:n

        scale = k^j*s0;
        sigma_In = scale;
        sigma_Dn = 0.7 * scale; % slide 81 

        gaussSigma_Dn = fspecial('Gaussian', round(3*sigma_Dn), sigma_Dn);
        gaussSigma_In = fspecial('Gaussian', round(3*sigma_In), sigma_In);
        
        dxGau = conv2(gaussSigma_Dn, dx);
        dyGau = conv2(gaussSigma_Dn, dy);        
        
        Lx = conv2(image, dxGau, 'same');
        Ly = conv2(image, dyGau, 'same');

        % elements of the matrix M
        Lx2 = Lx.^2;
        Ly2 = Ly.^2;
        Lxy = Lx.*Ly;

        % convolve elements of M again with a gaussian mask
        Lx2 = conv2(Lx2, gaussSigma_In.*(sigma_Dn^2), 'same'); 
        Ly2 = conv2(Ly2, gaussSigma_In.*(sigma_Dn^2), 'same');
        Lxy = conv2(Lxy, gaussSigma_In.*(sigma_Dn^2), 'same');


        % [a ,b]
        % [c, d]
        % det = a*d - c*d    => Lx2 * Ly2 - Lxy^2
        % trace^2 = (a+d)^2  => (Lx2 + Ly2)^2
        R = (Lx2.*Ly2 - Lxy.^2) - alpha*(Lx2 + Ly2).^2;

        % thresholding via logical indexing
        R(R<t) = 0;

        % non-maximum suppression
        output = nmsFilter(R, cornerDist);

        
        
        % find positons of corners
        [row, col, val] = find(output);

        
        % count corners
        n = size(row,1)
        
        % add corners at end of corner list
        list(end+1:end+n,:) = [row, col, repmat(scale, n, 1)];
        %list(end+1:end+n,:) = [row, col, val];

        % HELPERS
        maxR = max(output(:))
        output = Lxy;
        
        
        %for x = 1:size(image,1)
        %    for y = 1:size(image, 2)

        %       mat = [Lx2(x,y), Lxy(x,y); Lxy(x,y), Ly2(x,y)];

                %mat = conv2(mat, gaussianMask, 'same');

        %        R = det(mat) - alpha * (trace(mat) ^ 2);

        %        if (R > t && R > output(x,y))
        %            output(x,y) = R;
        %        end

        %    end
        %end


    end
    
    
    
    


end

