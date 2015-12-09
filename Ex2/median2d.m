function v_median  = median2d( array )
%median2d Finds the median of an array of numbers, ignoring dimensionality

    [y,x] = size(array);
    v_median = median(reshape(array, 1, y*x));

end

