function output = hogConvolution( hog_image, hog_object , cellsize)
%hog_image: the HOG of the scene
%hog_object: the HOG of the pot
%output, [a,b,c,d,e], from a to b rows and from c to d cols, e is the difference measurement 

output = [0, 0, 0, 0, 10000000];
[image_row, image_col, feature_imgae] = size(hog_image);
[object_row, object_col, featrue_object] = size(hog_object);
for j = 1 : (image_col - object_col + 1)
    for i = 1 : (image_row - object_row + 1)
        part_image = hog_image(i:(i+object_row-1),j:(j+object_col-1),:);
        score_matrix = zeros(object_row, object_col);
        for m = 1 : object_row
            for n = 1: object_col
                difference = part_image(m, n,:) - hog_object(m,n,:);
                difference = difference.^2;
                difference = sum(difference);
                score_matrix(m, n) = difference;
            end
        end
        total_difference = sum(sum(score_matrix));
        if total_difference < output(5)
            output = [i, i+object_row-1,j, j+object_col-1,total_difference];
        end      
    end
end
x = (output(3) - 1) * cellsize + 1;
y = (output(1) - 1) * cellsize + 1;
range_x = (output(2) - output(1)) * cellsize;
range_y = (output(4) - output(3)) * cellsize;
output = [x,y,range_x,range_y,output(5)];
end

