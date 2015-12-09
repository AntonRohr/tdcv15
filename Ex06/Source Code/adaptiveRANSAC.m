function [homography, final_points_ori, final_points_warped] = adaptiveRANSAC( image_points, warped_points, t, T, N )
    n = getAdaptiveSampleNum( image_points, warped_points, t );
    [homography, final_points_ori, final_points_warped] = RANSAC(image_points, warped_points, n, t, T, N);
end

