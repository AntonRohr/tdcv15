% read images

I = imread('shell.jpg');
I = im2single(rgb2gray(I));

Ib = imread('test_shell1.jpg');
Ib = im2single(rgb2gray(Ib));



merged = mergeImages(Ib, I);


[f,d] = vl_sift(I);
[fb,db] = vl_sift(Ib);

[matches, scores] = vl_ubcmatch(d, db);

f(1,:) = f(1,:)+size(Ib,2);

newf = zeros(4,0);
newfb = zeros(4,0);

for i = 1:size(matches, 2)
   
    %if scores(i) > 10000
        
    featureF = f(:, matches(1,i));
    newf(:,end+1) = featureF;
    featureFB = fb(:, matches(2,i));
    newfb(:,end+1) = featureFB;
    %end
end

%[newf, newfb] = deleteOutliers(newf, newfb);

[tform,list1,list2] = estimateGeometricTransform(newf(1:2,:)',newfb(1:2,:)','projective', 'Confidence', 60);

% create bounding box
% all [col, row]
bbTopLeft = [size(Ib, 2)+1, 1];
bbTopRight = [size(merged, 2), 1];
bbBottomRight = [size(merged,2), size(I,1)];
bbBottomLeft = [size(Ib, 2)+1, size(I, 1)];

% transform points to other image
bbTransformed = transformPointsForward(tform,[bbTopLeft; bbTopRight; bbBottomRight; bbBottomLeft]);

% create bb lines (topleft -> topRight, topRight -> bottomRight, ...)
bbDrawable = [bbTransformed(1,:), bbTransformed(2,:); bbTransformed(2,:), bbTransformed(3,:); bbTransformed(3,:), bbTransformed(4,:); bbTransformed(4,:), bbTransformed(1,:)];


% drawlist of matching features
drawList = [list1, list2];

% add bb to draw lines
drawList(end+1:end+4,:) = bbDrawable;

% draw
output = drawLines(merged, drawList);

imshow(output);

%perm = randperm(size(f,2)) ;
%sel = perm(1:75) ;
hb = vl_plotframe(newfb) ;
set(hb,'color','y','linewidth',2) ;

h = vl_plotframe(newf);
set(h, 'color', 'r', 'linewidth', 2);


