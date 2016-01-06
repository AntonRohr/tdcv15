function feature = extractFeature( r,c, width, height, int_image )
    A = int_image(r-1,c-1);
    B = int_image(r + height, c-1);
    C = int_image(r-1, c + width);
    D = int_image(r + height, c + width);

    feature = D - B - C + A;
end

