function [ boxSum ] = getBoxSum ( x, y, z, s )

% todo

% !!! this assumes x,y is upper left corner of box 

%box 
% a b 
% c d

ax = x;
ay = y;

bx = x+s;
by = y;

cx = x;
cy = y+s;

dx = x+s;
dy = y+s;

a = integralImage(ax, ay, z);
b = integralImage(bx, by, z);
c = integralImage(cx, cy, z);
d = integralImage(dx, dy, z);


boxSum = d-c-b+a;

end 