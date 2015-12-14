function [ e ] = energyEuler( x, A, Mi0, mit )
%ENERGYFUNCTION1 Summary of this function goes here
%   Detailed explanation goes here

alpha = x(1);
beta = x(2);
gamma = x(3);

Rx = [cos(alpha),-sin(alpha),0;sin(alpha),cos(alpha),0;0,0,1];
Ry = [cos(beta),0,sin(beta);0,1,0;-sin(beta),0,cos(beta)];
Rz = [1,0,0;0,cos(gamma),-sin(gamma);0,sin(gamma),cos(gamma)];

Rt = Rx * Ry * Rz;

Tt = [x(4); x(5); x(6)];

e = 0;
for i = 1 : size(Mi0,2) 
    tmp = A * ( Rt* Mi0(:,i) + Tt );
    tmp = tmp / tmp(3);
    e = e + (norm( tmp - [mit(:,i); 1] )^2);
end

