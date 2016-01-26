close all; clear all; clc;

%% Read in the images and convert them to something useful
faceA = double(rgb2gray(imread('data/faceA.jpg')));
faceB = double(rgb2gray(imread('data/faceB.jpg')));
faceC = double(rgb2gray(imread('data/faceC.jpg')));

%% Compute each integral image
int_A = integralImage(faceA); int_A = int_A(2:end,2:end);
int_B = integralImage(faceB); int_B = int_B(2:end,2:end);
int_C = integralImage(faceC); int_B = int_B(2:end,2:end);

%% Read in the weak classifiers and features
data = load('data/Classifiers.mat');
classifiers = data.classifiers;