clc;clear;

%after many times trying this is a good choice of original region
xmin = 510;
xmax = 560;
ymin = 310;
ymax = 343;
if ismac
    file_prefix = 'sequence/2043_0001';
else
    file_prefix = 'sequence\2043_0001';
end
file_suffix = '.jpeg';

for pic = 0 : 40
    %read image files
    num = num2str(40 + pic);
    file_name = [file_prefix, num, file_suffix];
    image = imread(file_name);
    [image_H, ~, ~] = rgb2hsv(image);
    %interation number
    k = 1;
    %initial offset of center
    x_update = 100;
    y_update = 100;
    while k <= 20 && norm([x_update, y_update]) >= 2
        image_reg = image_H(ymin:ymax, xmin:xmax);
        geometry_xc = round((xmax+xmin)/2);
        geometry_yc = round((ymax+ymin)/2);
        %get the histogram
        hist = colorHist(image_reg);
        %get the PDF
        probDist = probMap(image_reg, hist);        
        sum_x = 0;
        sum_y = 0;
        sum = 0;
        %straight forward apply fourmula
        for i = xmin : xmax
            for j = ymin:ymax
                sum = sum + probDist(j-ymin+1, i-xmin+1);
                sum_x = sum_x + i * probDist(j-ymin+1, i-xmin+1);
                sum_y = sum_y + j * probDist(j-ymin+1, i-xmin+1);
            end
        end
        %update the center and region 
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
    figure;
    imagesc(image);
    hold on;
    figure = plot(x_c, y_c, 'oy');
    if ismac
        saveas(gcf,strcat('results/Ex2/',num2str(pic)),'png');
    else
        saveas(gcf,strcat('results\Ex2\',num2str(pic)),'png');
    end
    hold off;
end

