function f_out = plotMatches( im1, im2, matches_1, matches_2)
%PLOTMATCHES Summary of this function goes here
%   Detailed explanation goes here

dh1 = max(size(im2,1)-size(im1,1),0) ;
dh2 = max(size(im1,1)-size(im2,1),0) ;

f_out = figure;
imagesc([padarray(im1,dh1,'post') padarray(im2,dh2,'post')]) ;
colormap gray;
o = size(im1,2) ;

pos1 = getBox(matches_1);
pos2 = getBox(matches_2);
pos2(1) = pos2(1) + o;

line([matches_1(1,:);matches_2(1,:)+o], ...
[matches_1(2,:);matches_2(2,:)], 'LineWidth', 1) ;

title(sprintf('Matches')) ;
 set(gca,'XTick',[]);
 set(gca,'YTick',[]);
 set(gca,'Position',[0 0 1 1]);
end

