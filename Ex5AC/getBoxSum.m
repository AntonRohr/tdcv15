function [ boxSum ] = getBoxSum ( x, y, z, s, integralImage )

% todo



%box 
% a b 
% c d

ax = x-s;
ay = y-s;

bx = x+s;
by = y-s;

cx = x-s;
cy = y+s;

dx = x+s;
dy = y+s;


if ax < 1 || ay < 1 || dx > size(integralImage, 2) || dy > size(integralImage, 1) || z < 1
	boxSum = 0;
else

	a = integralImage(ay, ax, z);
	b = integralImage(by, bx, z);
	c = integralImage(cy, cx, z);
	d = integralImage(dy, dx, z);


	boxSum = d-c-b+a;
end

end 