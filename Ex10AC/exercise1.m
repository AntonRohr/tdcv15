img = rgb2hsv(imread('sequence/2043_000140.jpeg'));


roi = img(269:348, 481:577, 1);


%imagesc(roi); colormap;


histogram = colorHist(roi);

%plot(histogram);

pd = probMap(roi,histogram);


mesh(pd);