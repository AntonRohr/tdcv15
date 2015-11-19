function pad_image = pad(initial_image, kernel, type)

initial_image = double(initial_image);
size_of_image = size(initial_image);
size_of_kernel = size(kernel);
x_ext = floor(size_of_kernel(1,1)/2);
y_ext = floor(size_of_kernel(1,2)/2);
%new_size = [(size_of_image(1,1) + x_ext), (size_of_image(1,2) + y_ext)];

if strcmp(type, 'zero')
    left_col = zeros(size_of_image(1,1),y_ext);
    initial_image = [left_col initial_image];
    initial_image = [initial_image left_col];
    top_row = zeros(x_ext, size_of_image(1,2) + 2*y_ext);
    initial_image = [top_row;initial_image];
    initial_image = [initial_image;top_row];


elseif strcmp(type, 'clamp')
    %corners
%     corner_ext = ones(x_ext,y_ext);
%     top_left = corner_ext * initial_image(1,1);
%     bottom_right = corner_ext * initial_image(end,end);
%     top_right = corner_ext * initial_image(1,end);
%     bottom_left = corner_ext * initial_image(end,1);
    
    left_col_of_initial = initial_image(:,1);
    right_col_of_initial = initial_image(:,size_of_image(1,2));
    for i = 1 : y_ext
        initial_image = [left_col_of_initial initial_image];
        initial_image = [initial_image right_col_of_initial];    
    end
    top_row_of_initial = initial_image(1,:);
    bottom_row_of_initial = initial_image(size_of_image(1,1),:);
    for i = 1 : x_ext
        initial_image = [top_row_of_initial;initial_image];
        initial_image = [initial_image;bottom_row_of_initial];    
    end
    
    %initial_image(1:x_ext,1:y_ext) = top_left;
    %initial_image(1:x_ext,end-y_ext+1:end) = top_right;
    %initial_image(end-x_ext+1:end,1:y_ext) = bottom_left;
    %initial_image(end-x_ext+1:end,end-y_ext+1:end) = bottom_left;
  
elseif strcmp(type, 'mirro')
    %deal with corners
    top_left = rot90(initial_image(1:x_ext,1:y_ext),2);
    bottom_right = rot90(initial_image(end-x_ext+1:end, end-y_ext+1:end),2);
    top_right = rot90(initial_image(1:x_ext, end-y_ext+1:end),2);
    bottom_left = rot90(initial_image(end-x_ext+1:end,1:y_ext),2);
    
    top_to_be_mirrored = flipud(initial_image(1:x_ext,:));
    bottom_to_be_mirrored = flipud(initial_image(end-x_ext+1:end,:));
    initial_image = [top_to_be_mirrored;initial_image];
    initial_image = [initial_image;bottom_to_be_mirrored];
    left_to_be_mirrored = fliplr(initial_image(:,1:y_ext));
    right_to_be_mirrored = fliplr(initial_image(:,end-x_ext+1:end));
    initial_image = [left_to_be_mirrored initial_image];
    initial_image = [initial_image right_to_be_mirrored];
    
    initial_image(1:x_ext,1:y_ext) = top_left;
    initial_image(end-x_ext+1:end, end-y_ext+1:end) = bottom_right;
    initial_image(1:x_ext,end-y_ext+1:end) = top_right;
    initial_image(end-x_ext+1:end,1:y_ext) = bottom_left;
end
pad_image = initial_image;
