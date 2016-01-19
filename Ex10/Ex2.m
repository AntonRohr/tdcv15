clear;
xmin = 508;
xmax = 555;
ymin = 310;
ymax = 345;
file_prefix = './sequence/2043_0001';
file_suffix = '.jpeg';

for pic = 0 : 40
    num = num2str(40 + pic);
    file_name = [file_prefix, num, file_suffix];
    image = imread(file_name);
    [image_H, ~, ~] = rgb2hsv(image);
    k = 1;
    x_update = 100;
    y_update = 100;
    while k <= 20 && norm([x_update, y_update]) >= 2
        image_reg = image_H(ymin:ymax, xmin:xmax);
        geometry_xc = round((xmax+xmin)/2);
        geometry_yc = round((ymax+ymin)/2);
        hist = colorHist(image_reg);
        probDist = probMap(image_H, hist);        
        sum_x = 0;
        sum_y = 0;
        sum = 0; 
        for i = xmin : xmax
            for j = ymin:ymax
                sum = sum + probDist(j, i);
                sum_x = sum_x + i * probDist(j, i);
                sum_y = sum_y + j * probDist(j, i);
            end
        end
        x_c = round(sum_x/sum);
        y_c = round(sum_y/sum);
        x_update = x_c - geometry_xc;
        y_update = y_c - geometry_yc;
        xmin = xmin+x_update;
        xmax = xmax+x_update;
        ymin = ymin+y_update;
        ymax = ymax+y_update;
        k = k + 1;
    end
end
figure;
imagesc(image);
hold on;
plot(x_c, y_c, 'oy');
hold off;