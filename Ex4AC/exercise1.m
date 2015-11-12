% read images

I = imread('shell.jpg');
I = im2single(rgb2gray(I));

Ib = imread('test_shell1.jpg');
Ib = im2single(rgb2gray(Ib));

imshowpair(I, Ib, 'montage');


[f,d] = vl_sift(I);

perm = randperm(size(f,2)) ;
sel = perm(1:75) ;
h1 = vl_plotframe(f(:,sel)) ;
h2 = vl_plotframe(f(:,sel)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;



