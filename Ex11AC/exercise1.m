inputImageRGB = imread('2043_000162.jpeg');
inputImageGray = rgb2gray(inputImageRGB);

templateRGB = inputImageRGB(337:400, 365:450, :);
templateGray = inputImageGray(337:400, 365:450);


scoresSSD = ssd(templateGray, inputImageGray);
scoresNCC = ncc(im2double(templateGray),im2double(inputImageGray));