data1 = load('data1.mat', 'dat');
data1 = data1.dat;
data2 = load('data2.mat');
data2 = data2.dat;
data3 = load('data3.mat');
data3 = data3.dat;

classifiers = load('Classifiers.mat');
classifiers = classifiers.classifiers;

faceA = rgb2gray(imread('faceA.jpg'));
faceB = rgb2gray(imread('faceB.jpg'));
faceC = rgb2gray(imread('faceC.jpg'));


%data1Pos = data1(data1(