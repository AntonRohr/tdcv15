function [ g ] = computeGxy( image, color )
%COMPUTEGXY computes the gradient of the image
%   Fit for color image and gray sacle image
if color
    [gradient_r, ~] = imgradient(image(:,:,1));
    [gradient_g, ~] = imgradient(image(:,:,2));
    [gradient_b, ~] = imgradient(image(:,:,3));
    g = max(gradient_r, gradient_g);
    g = max(g, gradient_b);
else
    [g, ~] = imgradient(image);
end

