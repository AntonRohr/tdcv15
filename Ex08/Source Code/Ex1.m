clear all; clc; close all;

%load data
[dat1, dat2, dat3] = loadData();

[dat1_x_1, dat1_y_1, dat1_x_2, dat1_y_2] = prepareData(dat1);
[dat2_x_1, dat2_y_1, dat2_x_2, dat2_y_2] = prepareData(dat2);
[dat3_x_1, dat3_y_1, dat3_x_2, dat3_y_2] = prepareData(dat3);

%plot origin data
% figure; 
% plot(dat1_x_1, dat1_y_1, 'or');
% hold on;
% plot(dat1_x_2, dat1_y_2, 'x');
% hold off;
% title('Data 1');
% 
% figure; 
% plot(dat2_x_1, dat2_y_1, 'or');
% hold on;
% plot(dat2_x_2, dat2_y_2, 'x');
% hold off;
% title('Data 2');
% 
% figure; 
% plot(dat3_x_1, dat3_y_1, 'or');
% hold on;
% plot(dat3_x_2, dat3_y_2, 'x');
% hold off;
% title('Data 3');

%AdaboostClassifier usage example
adaboost = AdaboostClassifier(20); %10 is the number of weak classifers
adaboost.Train(dat1(:,1:2),dat1(:,3)); %training data and correspond label
[x1,y1,x2,y2] = adaboost.Test(dat1); %x1 is the x coorinates of label1
plot(x1,y1,'or');hold on; plot(x2,y2,'x');hold off; title('TEST');