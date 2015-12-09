function homography = adaptiveRANSAC( image_points, warped_points, t, T, N )
    n = getAdaptiveSampleNum( image_points, warped_points, t );
    homography = RANSAC(image_points, warped_points, n, t, T, N);
end

