function transform = normalizingMatrix( points )
%NORMALIZINGMATRIX Takes an array of points, with x values in row 1, y values in row 2 
    
    %Compute the coordinates of the centroid
    mean_x = mean(points(1,:));
    mean_y = mean(points(2,:));
    
    sum_sq = 0;
    
    %Do the sum of squares for the distances from the centroid
    for p = 1:size(points,2)
        sum_sq = sum_sq + sqrt((points(1,p) - mean_x)^2 + (points(2,p) - mean_y)^2);
    end
    
    %Compute the scaling factor
    s = sqrt(2)*size(points,1)/sqrt(sum_sq);
    
    %The transform is in 2-D homogeneous coordinates. 
    %We translate down by the centroid, then scale by the size factor. 
    transform = s*[1 0 -mean_x; 0 1 -mean_y; 0 0 1/s];
end

