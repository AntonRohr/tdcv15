%% Read in the images and convert them to something useful
faceA = double(rgb2gray(imread('data/faceA.jpg')));
faceB = double(rgb2gray(imread('data/faceB.jpg')));
faceC = double(rgb2gray(imread('data/faceC.jpg')));

%% Compute each integral image
int_A = getIntegralImage(faceA);
int_B = getIntegralImage(faceB);
int_C = getIntegralImage(faceC);

%% Read in the weak classifiers and features
data = load('data/Classifiers.mat');
classifiers = data.classifiers;