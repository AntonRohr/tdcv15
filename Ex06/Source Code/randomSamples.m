function [selected_samples, selected_cor] = randomSamples( image_points, n )
%RANDOMSAMPLES return n random samples 

image_points_t = image_points';
[selected_samples, selected_cor] = datasample(image_points_t, n, 'Replace', false);
selected_samples = selected_samples';

end

