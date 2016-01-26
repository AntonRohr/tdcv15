function [ output ] = energyExp( R, A, Mi, mi)
%ENERGY 此处显示有关此函数的摘要
%   此处显示详细说明

a = R(1);
b = R(2);
c = R(3);

% Rx = [cos(a),-sin(a),0;sin(a),cos(a),0;0,0,1];
% Ry = [cos(b),0,sin(b);0,1,0;-sin(b),0,cos(b)];
% Rz = [1,0,0;0,cos(c),-sin(c);0,sin(c),cos(c)];
% 
% Rt = Rx * Ry * Rz;

w_hat = [0, -R(3), R(2) ; R(3) , 0 -R(1) ; -R(2), R(1), 0];
length_w = norm([R(1), R(2), R(3)]);    
Rt = eye(3) + w_hat / length_w * sin(length_w) + (w_hat^2)/(length_w^2) * (1-cos(length_w));

Tt = [R(4); R(5); R(6)];

output = 0;

for i = 1 : size(Mi,2) 
    temp = A * ( Rt* Mi(:,i) + Tt );
    temp = temp / temp(3);
    output = output + (norm( temp - [mi(:,i); 1] )^2);
end

end

