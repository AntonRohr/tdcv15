function [ dat_x_1, dat_y_1, dat_x_2, dat_y_2 ] = prepareData( data )
%PREPAREDATA extracts the class 

dat_x_1 = [];
dat_y_1 = [];
dat_x_2 = [];
dat_y_2 = [];

sample_num = size(data,1);

for i = 1 : sample_num
    if data(i, 3) == 1
        dat_x_1 = [dat_x_1, data(i, 1)];
        dat_y_1 = [dat_y_1, data(i, 2)];
    else
        dat_x_2 = [dat_x_2, data(i, 1)];
        dat_y_2 = [dat_y_2, data(i, 2)];
    end
end

end

