function feature = extractFeature( r,c, width, height, int_image )
    feature = int_image(r,c) + int_image(r+height, c+width) - ...
        int_image(r, c+width) - int_image(r+height, c);
end

