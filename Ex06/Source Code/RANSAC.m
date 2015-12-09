function [homography, final_points_ori, final_points_warped] = RANSAC( image_points, warped_points, n, t, T, N )
%RANSAC return a best homography given the parameters
%n: number of data points selected
%t: distance threshold
%T: size threshold
%N: number of trial
count_N = 1;

num_image_points = size(image_points, 2);

if(n > num_image_points)
    error('n should not be larger than the number of image points');
end

%containers of the 
% final_points_x_ori_cell = {};
% final_points_y_ori_cell = {};
% final_points_x_warped_cell = {};
% final_points_y_warped_cell = {};
% final_points_size = {};

%record the final choice of the points
final_points_ori = [];
final_points_warped = [];

max_size_T = 0;
while(count_N <= N)
    %record the num of inliers
    size_T = 0;
    %random select points from original pic
    [selected_samples, selected_col]= randomSamples(image_points, n);
    %get the correspond points in warped pic
    warped_points_t = warped_points';
    selected_warped = warped_points_t(selected_col,:);
    selected_warped = selected_warped';
    %get H using selected random points and the corresponding warped points
    H = DLT(selected_samples, selected_warped);
    %use H to get the transformed pic
    transformed_points = reproject(H, image_points);
    %calculate distance between transforemd by H one and the warped one
    for i = 1 : size(transformed_points,2)
        if(sqrt((transformed_points(1,i) - warped_points(1,i))^2 + ... 
                ((transformed_points(2,i) - warped_points(2,i))^2)) < t)
            size_T = size_T+1;
            temp_points_x_ori(size_T) = image_points(1,i);
            temp_points_y_ori(size_T) = image_points(2,i);
            temp_points_x_warped(size_T) = warped_points(1,i);
            temp_points_y_warped(size_T) = warped_points(2,i);
        end
    end
    
    %if the num of inliers larger than T, break
    if (size_T >= T )
        final_points_ori = [temp_points_x_ori;temp_points_y_ori];
        final_points_warped = [temp_points_x_warped;temp_points_y_warped];
%         final_points_x_ori_cell = {};
%         final_points_y_ori_cell = {};
%         final_points_x_warped_cell = {};
%         final_points_y_warped_cell = {};
%         final_points_size = {};
%         final_points_x_ori_cell{1} = final_points_x_ori;
%         final_points_y_ori_cell{1} = final_points_y_ori;
%         final_points_x_warped_cell{1} = final_points_x_warped;
%         final_points_y_warped_cell{1} = final_points_y_warped;
%         final_points_size{1} = size_T;
        break;
    %otherwise just save the ones with largest num of inliers
    elseif (size_T > max_size_T)
%         final_points_x_ori_cell{count_N} = final_points_x_ori;
%         final_points_y_ori_cell{count_N} = final_points_y_ori;
%         final_points_x_warped_cell{count_N} = final_points_x_warped;
%         final_points_y_warped_cell{count_N} = final_points_y_warped;
%         final_points_size{count_N} = size_T;
        final_points_ori = [temp_points_x_ori;temp_points_y_ori];
        final_points_warped = [temp_points_x_warped;temp_points_y_warped];
        max_size_T = size_T;
    end
    
    count_N = count_N+1; 
end

% if(size(final_points_size,2) == 1)
%     final_points_ori = [final_points_x_ori_cell{1};final_points_y_ori_cell{1}];
%     final_points_warped = [final_points_x_warped_cell{1};final_points_y_warped_cell{1}];
% else
%     max_col = getMaxInCell(final_points_size);
%     final_points_ori = [final_points_x_ori_cell{max_col};final_points_y_ori_cell{max_col}];
%     final_points_warped = [final_points_x_warped_cell{max_col};final_points_y_warped_cell{max_col}];
% end

homography = DLT(final_points_ori, final_points_warped);

end

