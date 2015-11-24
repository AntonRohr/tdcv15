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


% Matlab color channels:
% 1 = red
% 2 = green
% 3 = blue

% our channels
% 0 = blue
% 1 = green
% 2 = red
% 3 = red
if z == 0
	channel = 3; % blue 
elseif z = 1
	channel = 2; % green
elseif z = 2 || z = 3
	channel = 1; % red
end



if ax < 1 || ay < 1 || dx > size(integralImage, 2) || dy > size(integralImage, 1)
	boxSum = 0;
else

	a = integralImage(ay, ax, channel);
	b = integralImage(by, bx, channel);
	c = integralImage(cy, cx, channel);
	d = integralImage(dy, dx, channel);


	boxSum = d-c-b+a;
end

end 