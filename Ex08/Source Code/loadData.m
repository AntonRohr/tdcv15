function [dat1, dat2, dat3] = loadData()
%load data to work space

dat1 = load('data/data1.mat');
dat2 = load('data/data2.mat');
dat3 = load('data/data3.mat');
dat1 = dat1.dat;
dat2 = dat2.dat;
dat3 = dat3.dat;

end

