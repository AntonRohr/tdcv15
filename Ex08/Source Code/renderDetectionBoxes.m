function renderDetectionBoxes( image, detected )
% Renders detection boxes at each point a positive return was reached. 

figure;
imagesc(image);
hold on;
colormap 'gray';

for i = 1:size(detected,2)
    x = detected{i}(1);
    y = detected{i}(2);
    rectangle('position',[x y 19 19], 'edgecolor','r', 'LineWidth',2);
end

hold off;

end

