function [ e ] = energyFunction( x, A, Mi0, mit )
%ENERGYFUNCTION1 Summary of this function goes here
%   Detailed explanation goes here


w_hat = [0, -x(3), x(2) ; x(3) , 0 -x(1) ; -x(2), x(1), 0];
length_w = norm([x(1), x(2), x(3)]);    
Rt = eye(3) + w_hat / length_w * sin(length_w) + (w_hat^2)/(length_w^2) * (1-cos(length_w));

Tt = [x(4); x(5); 1];

e = 0;
for i = 1 : size(Mi0,2) 
    tmp = A * ( Rt* Mi0(:,i) + Tt );
    tmp = tmp / tmp(3);
    e = e + (norm( tmp - [mit(:,i); 1] )^2);
end

