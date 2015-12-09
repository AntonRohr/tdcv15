function sample_num = getAdaptiveSampleNum( image_points, warped_points, t )

p = 0.99;
N = 1;
n = 0;
total_points_num = size(image_points,2);

while(N > n)
    size_T = 0;
    n = 4;
    [selected_samples, selected_col]= randomSamples(image_points, n);
    warped_points_t = warped_points';
    selected_warped = warped_points_t(selected_col,:);
    selected_warped = selected_warped';
    H = DLT(selected_samples, selected_warped);
    transformed_points = reproject(H, image_points);
    for i = 1 : size(transformed_points,2)
        if(sqrt((transformed_points(1,i) - warped_points(1,i))^2 + ... 
                ((transformed_points(2,i) - warped_points(2,i))^2)) < t)
            size_T = size_T+1;
        end
    end
    para = 1 - size_T/total_points_num;
    N = log(1 - p)/log(1-(1-para)^size_T);
    n = n+1;
end

sample_num = n;

end

