% read in the images
boxImageGray = imread('box.pgm');
sceneImageGray = imread('scene.pgm');

result1 = stitchImages(boxImageGray, sceneImageGray);

result2 = stitchImages(sceneImageGray, boxImageGray);

subplot(2,2,1);
imshow(boxImageGray);

subplot(2,2,2);
imshow(sceneImageGray);

subplot(2,2,3);
imshow(result1);

subplot(2,2,4);
imshow(result2);