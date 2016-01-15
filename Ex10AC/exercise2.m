% imshow(imageSeq{1}(310:345, 508:555,1))
imageSeq = readImages();

%initial x and y (x -> col; y -> row)
xmin = 508;
ymin = 310;
xmax = 555;
ymax = 345;



imshow(drawRectangle(hsv2rgb(imageSeq{1}),ymin,xmin, ymax,xmax));


for i = 1:size(imageSeq,1)
    tic;
    currentImg = imageSeq{i}(:,:,1);
    count = 0;
    xmove = 10000;
    ymove = 10000;
    while count < 20 && norm([xmove,ymove]) > 2 
        % initial roi (regoin of interest (car))
        roi = currentImg(ymin:ymax, xmin:xmax);

        roixc = xmin + round((xmax-xmin)/2);
        roiyc = ymin + round((ymax-ymin)/2);

        % get the colorHistogram of the region with the car
        histogram = colorHist(roi);

        % probabilistic density of whole image
        pd = probMap(currentImg, histogram);

        Pi = 0;
        xPi = 0;
        yPi = 0;
        for x = xmin:xmax
            for y = ymin:ymax
                Pi = Pi + pd(y,x);
                xPi = xPi + x*pd(y,x);
                yPi = yPi + y*pd(y,x);
                
            end
        end

        xc = round(xPi/Pi);
        yc = round(yPi/Pi);

        xmove = xc-roixc;
        ymove = yc-roiyc;
        
        xmin = xmin+(xmove);
        xmax = xmax+(xmove);
        ymin = ymin+(ymove);
        ymax = ymax+(ymove);
        
        count = count +1;
    end
    toc;

    drawedImg = drawRectangle(hsv2rgb(imageSeq{i}),ymin,xmin, ymax,xmax);
    imshow(drawedImg);
    imwrite(drawedImg,['result/img_', sprintf('%03d',i), '.png']);
    
end