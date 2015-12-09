%Initialise the vl library.
run('C:\Users\Anton Troynikov\Documents\MATLAB\vlfeat-0.9.20-bin\vlfeat-0.9.20\toolbox\vl_setup.m')

%Load the images
box = imread('box.pgm');
scene = imread('scene.pgm');

%Get point correspondences
[ matches_box, matches_scene ] = matchSIFT(single(box), single(scene));

%Plot the naive correspondences
plotMatches(box, scene, matches_box, matches_scene);

%Compute homography via RANSAC
n = 10; t = 1; T = 5; N = 10;
H = RANSAC(matches_box, matches_scene, n, t, T, N);

%Compute a MATLAB transform from the homography
box_to_scene = projective2d(H');
%Compute the inverse transform as well (to not repeat RANSCAC)
scene_to_box = invert(box_to_scene);

%Warp the two images as needed
warped_scene = imwarp(scene, scene_to_box);
warped_box = imwarp(box, box_to_scene);

%Compute the translation vector of the warped box in the original scene
translation = H./H(3,3);
translation = floor(translation([1,2],3));

y_warped_box = translation(2);
x_warped_box = translation(1);

%Create the overlapped scene
overlapped_scene = overlapImage(scene, warped_box, x_warped_box, y_warped_box);

%Compute the translation vector of the original box into the warped scene
K = scene_to_box.T'
translation = -K./K(3,3);
translation = floor(translation([1,2],3));

y_warped_scene = translation(2);
x_warped_scene = translation(1);

%Create the overlaped box
overlapped_scene = overlapImage(warped_scene, box, x_warped_scene, y_warped_scene);

imagesc(overlapped_scene);