function box_sum = boxSum( integral_image, x, y, s, channel )
%BOXSUM Finds the 4-point box sum given coordinates and the integral image.
%   a little slower than I'd like, we should do this in a vectorised way.
%box 
% a b 
% c d

ax = x-s-1;
ay = y-s-1;

dx = x+s;
dy = y+s;


if dy < 1 || dx < 1 || ax >= size(integral_image, 2) || ay >= size(integral_image, 1)
	box_sum = 0;
else

	dx = min(dx, size(integral_image, 2));
	dy = min(dy, size(integral_image, 1));

	bx = dx;
	by = ay;

	cx = ax;
	cy = dy;

	if ax < 1 && ay < 1
		d = integral_image(dy, dx, channel);
		box_sum = d;
	elseif ax < 1
		b = integral_image(by, bx, channel);
		d = integral_image(dy, dx, channel);	
		box_sum = d-b;
	elseif ay < 1
		c = integral_image(cy, cx, channel);
		d = integral_image(dy, dx, channel);
		box_sum = d-c;
	else 
		a = integral_image(ay, ax, channel);
		b = integral_image(by, bx, channel);
		c = integral_image(cy, cx, channel);
		d = integral_image(dy, dx, channel);
		box_sum = d-c-b+a;
	end

end

end

