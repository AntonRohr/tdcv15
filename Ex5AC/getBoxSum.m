function [ boxSum ] = getBoxSum ( x, y, z, s, integralImage )


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
elseif z == 1
	channel = 2; % green
elseif z == 2 || z == 3
	channel = 1; % red
end

%box 
% a b 
% c d

ax = x-s-1;
ay = y-s-1;

dx = x+s;
dy = y+s;


if dy < 1 || dx < 1 || ax > size(integralImage, 2) || ay > size(integralImage, 1)
	boxSum = 0;
else

	dx = min(dx, size(integralImage, 2));
	dy = min(dy, size(integralImage, 1));

	bx = dx;
	by = ay;

	cx = ax;
	cy = dy;

	if ax < 1 && ay < 1
		d = integralImage(dy, dx, channel);
		boxSum = d;
	elseif ax < 1
		b = integralImage(by, bx, channel);
		d = integralImage(dy, dx, channel);	
		boxSum = d-b;
	elseif ay < 1
		c = integralImage(cy, cx, channel);
		d = integralImage(dy, dx, channel);
		boySum = d-c;
	else 
		a = integralImage(ay, ax, channel);
		b = integralImage(by, bx, channel);
		c = integralImage(cy, cx, channel);
		d = integralImage(dy, dx, channel);
		boxSum = d-c-b+a;
	end

end
	


end 