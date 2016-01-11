function [ gridPoints ] = createRectPatch( img, upperLeft, winSize )
%CREATERECTPATCH Summary of this function goes here
%   Detailed explanation goes here



% gridPoint(i,:) = [col, row, intesity];

gridPoints = zeros(0,3);

count = 1;
for col = upperLeft(1) : 5 : (upperLeft(1)+winSize)
    for row = upperLeft(2) : 5 : (upperLeft(2)+winSize)
        %tmp = [col, row, img(row,col)];
        %gridPoints(count,:) = tmp;
        gridPoints(count,1) = col;
		gridPoints(count,2) = row;
		gridPoints(count,3) = img(row,col);
        
        count = count +1;
    end
end

end

