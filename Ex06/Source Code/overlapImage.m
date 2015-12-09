function overlapped = overlapImage(image_1, image_2, t_x, t_y )
%Add image 2 into image 1 at the point (t_x,t_y)

col_1 = t_x;
row_1 = t_y;
col_2 = t_x + size(image_2, 2) - 1;
row_2 = t_y + size(image_2, 1) - 1;

overlapped = image_1;

overlapped(row_1:row_2, col_1:col_2) = overlapped(row_1:row_2, col_1:col_2) + image_2;


end

