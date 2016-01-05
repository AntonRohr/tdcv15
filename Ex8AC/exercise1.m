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


% split data1
data1Pos = data1(data1(:,3) == 1, :);
data1Neg = data1(data1(:,3) == -1, :);

% split data2
data2Pos = data2(data2(:,3) == 1, :);
data2Neg = data2(data2(:,3) == -1, :);

% split data3
data3Pos = data3(data3(:,3) == 1, :);
data3Neg = data3(data3(:,3) == -1, :);

subplot(2,2,1);
scatter(data1Pos(:,1), data1Pos(:,2), '+');
hold on;
scatter(data1Neg(:,1), data1Neg(:,2), 'o');
hold off;

subplot(2,2,2);
scatter(data2Pos(:,1), data2Pos(:,2), '+');
hold on;
scatter(data2Neg(:,1), data2Neg(:,2), 'o');
hold off;

subplot(2,2,3);
scatter(data3Pos(:,1), data3Pos(:,2), '+');
hold on;
scatter(data3Neg(:,1), data3Neg(:,2), 'o');
hold off;