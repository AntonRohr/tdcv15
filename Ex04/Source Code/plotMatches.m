function plotMatches( im1, im2, matches_1, matches_2)
%PLOTMATCHES Summary of this function goes here
%   Detailed explanation goes here

dh1 = max(size(im2,1)-size(im1,1),0) ;
dh2 = max(size(im1,1)-size(im2,1),0) ;

figure(1) ; clf ;
imagesc([padarray(im1,dh1,'post') padarray(im2,dh2,'post')]) ;
o = size(im1,2) ;
colormap gray;
line([matches_1(1,:);matches_2(1,:)+o], ...
     [matches_1(2,:);matches_2(2,:)], 'LineWidth', 2, 'color', 'g') ;
title(sprintf('Tentative matches')) ;
end

