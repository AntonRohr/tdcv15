clear;
xmin = 480;
xmax = 560;
ymin = 280;
ymax = 350;
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
    image_reg = image_H(ymin:ymax, xmin:xmax);
    hist = colorHist(image_reg);
    h = histogram(image_reg(:));
    h.NumBins = 256;
    h.BinLimits = [0,1];
    prob = probMap(image_reg,hist);
    if ismac
        saveas(gcf,strcat('results/Ex1/','Histogram',num2str(pic)),'png');
    else
        saveas(gcf,strcat('results\Ex1\','Histogram',num2str(pic)),'png');
    end
    bar3(prob);
    if ismac
        saveas(gcf,strcat('results/Ex1/','PDF',num2str(pic)),'png');
    else
        saveas(gcf,strcat('results\Ex1\','PDF',num2str(pic)),'png');
    end
    close(figure);
end
     