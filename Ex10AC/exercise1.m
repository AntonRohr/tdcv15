img = rgb2hsv(imread('sequence/2043_000140.jpeg'));


roi = img(269:348, 481:577, 1);
roi2 = img(269:348, 481:577, 2);
roi3 = img(269:348, 481:577, 3);


%imagesc(roi); colormap;


histogram = zeros(1,256);

for i = 1:(size(roi,1)*size(roi,2))
    % hue = bucket
    hue = round(roi(i)*255)+1;
    histogram(hue) = histogram(hue)+1;   
end

%plot(histogram);

pd = probMap(roi,histogram);

%mesh(probMap(img(:,:,1), histogram));

%mesh(pd);