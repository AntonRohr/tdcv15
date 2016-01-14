% imshow(imageSeq{1}(310:345, 508:555,1))
imageSeq = readImages();

% get Box that tightly embraces car (and get center from that box)
carRegion = imageSeq{1}(310:345, 508:555,1);
roiCenter = [ 508 + round((555-508)/2) , 310 + round((345-310) / 2) ]
%imagesc(carRegion);

% get the colorHistogram of the region with the car
carHistogram = colorHist(carRegion);
%plot(carHistogram)
