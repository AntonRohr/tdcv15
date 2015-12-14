%% initialization for first image (0000.png)


% initialize R0 and T0
R0 = eye(3);
T0 = [0; 0; 0];

% initialize intrinsic camera matrix
A = [472.3 0.64 329.0 ; 0 471.0 268.3 ; 0 0 1];

% initialize the first image
I0RGB = imread('img_sequence/0000.png');
I0 = im2single(rgb2gray(I0RGB));

% compute sift features and descriptors 
[feat0, desc0] = vl_sift(I0(73:390, 97:557));
feat0(1,:) = feat0(1,:)+97;
feat0(2,:) = feat0(2,:)+73;

% upperLeft = [ 97 ; 73 ]
% downRight = [ 557 ; 385 ]

m0 = [ feat0(1,:) ; feat0(2,:) ; ones(1,size(feat0,2)) ];

% do backprojection
M0 = inv(A) * m0;


%% _________________________________Loading exercise 2 (the comparison of other stuff)

% get the remaining images and save them to a cellArray
% e.g. image{1} is '0001.png'
images = readImages();

inliers = cell(44,2);


savedCam = zeros(44, 3);


for i = 1:44
    tic
    % get the current image and do conversion for feature extraction
    currentImageRGB = images{i};    
    currentImage = im2single(rgb2gray(currentImageRGB));
        
    [feati, desci] = vl_sift(currentImage);
    
    matchThreshold = 2.5;
    [matchesi, scoresi] = vl_ubcmatch(desc0, desci, matchThreshold); 
    
    % filter out matched features (without orientation/scale)
    matchedFeat0 = feat0(1:2,matchesi(1,:));
    matchedFeati = feati(1:2,matchesi(2,:));
    
    % get Homography and inliers
    % size(matchesi)
    [tform,inlyingFeat0,inlyingFeati] = estimateGeometricTransform(matchedFeat0',matchedFeati','projective', 'MaxNumTrials', 10000);
    
    % get homography and inliers our way
    %[inlierIndices, H] = ransacAdapted(matchedFeat0, matchedFeati, 1,4);
    %inlyingFeat0 = matchedFeat0(:,inlierIndices);
    %inlyingFeati = matchedFeati(:,inlierIndices);
    
    %inlyingM0 = M0(:, inlierIndices);
    inlyingFeat0 = inlyingFeat0';
    inlyingFeati = inlyingFeati';
    inlyingM0 = inv(A) * [inlyingFeat0; ones(1,size(inlyingFeat0,2)) ];
    
    % visualizing features
    output = drawMatches(I0RGB, currentImageRGB, inlyingFeat0, inlyingFeati);
    %imshow(output);
    
    % save inlyingFeatures
    inliers{i}{1} = inlyingM0;
    inliers{i}{2} = inlyingFeati;
    
    
    imwrite(output,['result_sequence/img_', sprintf('%03d',i), '.png']);
    toc
    
end







%I1RGB = imread('img_sequence/0001.png');
%I1 = im2single(rgb2gray(I1RGB));

% [feat1, desc1] = vl_sift(I1);

%matchThreshold = 1;
%[matches, scores] = vl_ubcmatch(desc0, desc1, matchThreshold); 

% filter out matched features (without orientation/scale)
% matchedFeat1 = feat0(1:2,matches(1,:));
% matchedFeat2 = feat1(1:2,matches(2,:));

% get Homography

% [tform,inlyingFeat0,inlyingFeat1] = estimateGeometricTransform(matchedFeat1',matchedFeat2','projective');


% visualizing features
% output = drawMatches(I0RGB, I1RGB, inlyingFeat0', inlyingFeat1');
% imshow(output);
