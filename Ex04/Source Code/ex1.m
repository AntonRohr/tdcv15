%Initialise the vl library.
run('C:\Users\Anton Troynikov\Documents\MATLAB\vlfeat-0.9.20-bin\vlfeat-0.9.20\toolbox\vl_setup.m')

%Load and convert images into single-precision grayscale for use with vl lib. 
shell = single(rgb2gray(imread('shell.jpg')));
pot = single(rgb2gray(imread('pot.jpg')));

test_shell1 = single(rgb2gray(imread('test_shell1.jpg')));
test_shell2 = single(rgb2gray(imread('test_shell2.jpg')));

test_pot1 = single(rgb2gray(imread('test_pot1.jpg')));
test_pot2 = single(rgb2gray(imread('test_pot2.jpg'))); 

%Extract features, descriptors, and matches

%shell with test1
[f_shell, f_test1, d_shell, d_test1, matches_s_1] = matchSIFT(shell, test_shell1);

%Demonstrate a plot of features
figure;
imagesc(shell);
colormap gray;
vl_plotframe(f_shell);

figure;
imagesc(test_shell1);
colormap gray;
vl_plotframe(f_test1);

%Plot unpruned matches
[match_shell, match_test_1] = match_points(f_shell, f_test1, matches_s_1);
plotMatches(shell, test_shell1, match_shell, match_test_1);

%Plot prined matches
[pruned_shell, pruned_test1] = pruneMatches(match_shell, match_test_1);
plotMatches(shell, test_shell1, pruned_shell, pruned_test1);

%Now try the pot
[f_pot, f_test1, d_pot, d_test1, matches_p_1] = matchSIFT(pot, test_pot1);

%Do we have SIFT features even?
figure;
imagesc(pot);
colormap gray;
vl_plotframe(f_pot);

[match_pot, match_test_1] = match_points(f_pot, f_test1, matches_p_1);
plotMatches(pot, test_pot1, match_pot, match_test_1);

%Try pruning...
%[pruned_pot, pruned_test1] = pruneMatches(match_pot, match_test_1);
%plotMatches(pot, test_pot1, pruned_pot, pruned_test1);
%Pruning can't find 3 inliers! 

