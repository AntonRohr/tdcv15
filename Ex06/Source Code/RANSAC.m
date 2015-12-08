function homography = RANSAC( image_points, warped_points, n, t, T, N )
%RANSAC return a best homography given the parameters
%n: number of data points selected
%t: distance threshold
%T: size threshold
%N: number of trial
count_N = 1;

num_image_points = size(image_points, 2);

if(t > num_image_points)
    error('t should be larger than the number of image points');
end

final_points_x_ori_cell = {};
final_points_y_ori_cell = {};
final_points_x_warped_cell = {};
final_points_y_warped_cell = {};
final_points_size = {};

final_points_ori = [];
final_points_warped = [];

while(count_N <= N)
    size_T = 0;
    final_points_x_ori = [];
    final_points_y_ori = [];
    final_points_x_warped = [];
    final_points_y_warped = [];
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
            final_points_x_ori(size_T) = image_points(1,i);
            final_points_y_ori(size_T) = image_points(2,i);
            final_points_x_warped(size_T) = warped_points(1,i);
            final_points_y_warped(size_T) = warped_points(2,i);
        end
    end
    
    if (size_T >= T )
        final_points_x_ori_cell = {};
        final_points_y_ori_cell = {};
        final_points_x_warped_cell = {};
        final_points_y_warped_cell = {};
        final_points_size = {};
        final_points_x_ori_cell{1} = final_points_x_ori;
        final_points_y_ori_cell{1} = final_points_y_ori;
        final_points_x_warped_cell{1} = final_points_x_warped;
        final_points_y_warped_cell{1} = final_points_y_warped;
        final_points_size{1} = size_T;
        break;
    else
        final_points_x_ori_cell{count_N} = final_points_x_ori;
        final_points_y_ori_cell{count_N} = final_points_y_ori;
        final_points_x_warped_cell{count_N} = final_points_x_warped;
        final_points_y_warped_cell{count_N} = final_points_y_warped;
        final_points_size{count_N} = size_T;
    end
    
    count_N = count_N+1; 
end

if(size(final_points_size,2) == 1)
    final_points_ori = [final_points_x_ori_cell{1};final_points_y_ori_cell{1}];
    final_points_warped = [final_points_x_warped_cell{1};final_points_y_warped_cell{1}];
else
    max_col = getMaxInCell(final_points_size);
    final_points_ori = [final_points_x_ori_cell{max_col};final_points_y_ori_cell{max_col}];
    final_points_warped = [final_points_x_warped_cell{max_col};final_points_y_warped_cell{max_col}];
end

homography = DLT(final_points_ori, final_points_warped);

end

