function box_sum = boxSum( integral_image, x, y, s, channel )
%BOXSUM Finds the 4-point box sum given coordinates and the integral image.
%   a little slower than I'd like, we should do this in a vectorised way.

%Pad the integral image with enough zeroes to be safe
padded_image = padarray(integral_image, s);

%Offset indices
x = x+s;
y = y+s;

%Return the sum
box_sum = padded_image(y+s ,x+s ,channel) - padded_image( x-s ,y+s ,channel) ... 
            - padded_image(x+s, x-s ,channel) + padded_image(x-s, y-s ,channel);

end

