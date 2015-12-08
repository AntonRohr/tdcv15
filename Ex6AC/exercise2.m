% read in the images
boxImageGray = imread('box.pgm');
sceneImageGray = imread('scene.pgm');

[matchedFeatBox, matchedFeatSc] = createFeatureMatches(boxImageGray, sceneImageGray);



% parameters
N = 40;
t = 2;
k = 4;
T = 0.7 * size(matches,2); 

[inlierIndices, H] = ransacManual(matchedFeatBox, matchedFeatSc, T, t, k, N );

%size(inlierIndices,2)
%H

[inlierIndices, H] = ransacAdapted(matchedFeatBox, matchedFeatSc, t, k );

%size(inlierIndices,2)
%H


H = maketform('projective',H');
%H = projective2d(H');
%H = affine2d(H);
%H = projective2d([1,0,-10;0,1,-10;0,0,1]);
%[im2t,RB] = imwarp(boxImageGray, H);
%imshow(im2t);
%H.tdata.T


[im2t,xdataim2t,ydataim2t]=imtransform(boxImageGray,H);
% now xdataim2t and ydataim2t store the bounds of the transformed im2
xdataout=[min(1,xdataim2t(1)) max(size(sceneImageGray,2),xdataim2t(2))];
ydataout=[min(1,ydataim2t(1)) max(size(sceneImageGray,1),ydataim2t(2))];
% let's transform both images with the computed xdata and ydata
im2t=imtransform(boxImageGray,H,'XData',xdataout,'YData',ydataout);
im1t=imtransform(sceneImageGray,maketform('affine',eye(3)),'XData',xdataout,'YData',ydataout);


ims=im1t/2+im2t/2;
figure, imshow(ims);
%imshowpair(im1t, im2t);
%imshowpair(ims,sceneImageGray,'diff');