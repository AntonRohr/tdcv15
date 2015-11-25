function box_sum = boxSum( integral_image, x, y, s, channel )
%BOXSUM Finds the 4-point box sum given coordinates and the integral image.
%   a little slower than I'd like, we should do this in a vectorised way.

%Clamp the box to edges
if(x < 1)
    x = 1;
end

if(y < 1)
    y = 1;
end

if (x > size(integral_image,2))
    x = size(integral_image,2);
end

if (y > size(integral_image,1))
    y = size(integral_image,1);
end

%Pad by size and offset indices. 
padded_image = padarray(integral_image, [s,s]);
x = x + s;
y = y + s;

%Return the sum
box_sum = padded_image(y+s ,x+s ,channel) - padded_image( y+s, x-s ,channel) ... 
            - padded_image(y-s, x+s ,channel) + padded_image(y-s, x-s ,channel);

end

