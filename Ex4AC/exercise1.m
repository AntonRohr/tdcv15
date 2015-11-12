% read images

I = imread('shell.jpg');
I = im2single(rgb2gray(I));

Ib = imread('test_shell1.jpg');
Ib = im2single(rgb2gray(Ib));

imshow(mergeImages(Ib, I));




[f,d] = vl_sift(I);
[fb,db] = vl_sift(Ib);

[matches, scores] = vl_ubcmatch(d, db);

f(1,:) = f(1,:)+size(Ib,2);

newf = zeros(4,0);
newfb = zeros(4,0);

for i = 1:size(matches, 2)
   
    %if scores(i) > 10000
        
    featureF = f(:, matches(1,i))
    newf(:,end+1) = featureF;
    featureFB = fb(:, matches(2,i))
    newfb(:,end+1) = featureFB;
    %end
end


%perm = randperm(size(f,2)) ;
%sel = perm(1:75) ;
hb = vl_plotframe(newfb) ;
set(hb,'color','y','linewidth',2) ;

h = vl_plotframe(newf);
set(h, 'color', 'r', 'linewidth', 2);


