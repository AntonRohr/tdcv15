function box_sum = boxSum( integral_image, x, y, s, channel )
%BOXSUM Finds the 4-point box sum given coordinates and the integral image.

box_sum = integral_image(y+s ,x+s ,channel) - integral_image( x-s ,y+s ,channel) ... 
            -integral_image(x+s, x-s ,channel) + integral_image(x-s, y-s ,channel);

end

