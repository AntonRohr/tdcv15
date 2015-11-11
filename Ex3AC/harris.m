function [ output, list ] = harris( image, n, s0, k, alpha, t )

    output = zeros(size(image,1), size(image,2), n);

    cornerDist = round(max(size(image)) / 100); %distancebetween to corners


    dx = [-1,0,1;-1,0,1;-1,0,1];
    dy = dx';

    list = zeros(0,4);

    for j = 1:n

        sigma_In = k^j*s0;
        sigma_Dn = 0.7 * sigma_In; % slide 81 

        gaussSigma_Dn = fspecial('Gaussian', ceil(3*sigma_Dn), sigma_Dn);
        gaussSigma_In = fspecial('Gaussian', ceil(3*sigma_In), sigma_In);
               
        % ORIGINAL - first gauss, then derivate mast
        gaussed = conv2(image, gaussSigma_Dn, 'same');
        
        Lx = conv2(gaussed, dx, 'same');
        Ly = conv2(gaussed, dy, 'same');
        
        % ALTERNATIVE 1 - this seems to be the derivate of gauss. 
        %x  = -round(3*sigma_Dn):round(3*sigma_Dn);
        %dx = x .* exp(-x.*x/(2*sigma_Dn*sigma_Dn)) ./ (sigma_Dn*sigma_Dn*sigma_Dn*sqrt(2*pi));
        %dy = dx';
        
        %Lx = conv2(image, dx, 'same');
        %Ly = conv2(image, dy, 'same');        
        
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
        output(:,:,j) = nmsFilter(R, cornerDist);
        
        % find positons of corners
        [row, col, val] = find(output(:,:,j));
        %[row, col, val] = findLocalMaximum(R, cornerDist);
        
        % count corners
        n = size(row,1)
        
        % add corners at end of corner list
        list(end+1:end+n,:) = [row, col, repmat(j, n, 1), repmat(sigma_In, n, 1)];
        %list(end+1:end+n,:) = [row, col, val];
      
        
        

    end
    
    
end

