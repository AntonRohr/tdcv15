% get the imageSequence
imageSeq = readImages();


%% Exercise a) Define Region

% define region of interest in the first image
refRoi = imageSeq{1}(269:348, 481:577, 1);

%% Exercise b) Calculate color histogram

% plot the histogram for the first image
refHistogram = colorHist(refRoi);
plot(refHistogram);

%% Exercise c) Calculate probability distribution

pd = probMap(refRoi, refHistogram);
mesh(pd)


% do it for all images in the sequence for the same region of interest
for i = 2:size(imageSeq,1)
   roi = imageSeq{i}(269:348, 481:577, 1);
   histogram = colorHist(roi);
   
   pd = probMap(roi, histogram);
   mesh(pd);
   
   % use this to actually see the intermediate results
   pause(1);
   
end
