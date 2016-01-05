function feature = extractFeature( r,c, width, height, int_image )
    feature = int_image(r,c) + int_image(r+height-1, c+width-1) - ...
        int_image(r, c+width-1) - int_image(r+height-1, c);
end

