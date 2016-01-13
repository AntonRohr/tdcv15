function intensity_deltas = computeIntensityDeltas(reference_image, grid_coordinates, homographies)
%COMPUTEINTENSITYDELTAS computes the difference in intensities for each
%grid point between the warped and reference images. 

%Normalize the reference image and add a little noise
reference_norm = normalizeImage(reference_image);


intensity_deltas = zeros(size(grid_coordinates,2), size(homographies,2));
for i = 1 : size(homographies,2)
    %Warp the image, saving the coordinate translation
    [warped_image, coord_ref] = imwarp(reference_norm, homographies{i});
    warped_norm = normalizeImage(warped_image);
    
    %Sample the warped image at each grid coordinate
    for j = 1:size(grid_coordinates,2)
        [x, y] = worldToIntrinsic(coord_ref, grid_coordinates(1,j), grid_coordinates(2,j));
        intensity_deltas(j,i) = warped_norm(floor(y),floor(x)) - ...
        reference_norm(grid_coordinates(2,j),grid_coordinates(1,j));
    end
end


end

