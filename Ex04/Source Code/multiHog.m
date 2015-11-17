function output = multiHog( original_scene, original_object, scale_para, scale_steps, cellsize )

original_scene = single(rgb2gray(original_scene));
original_object = single(rgb2gray(original_object));
min = [0, 0, 0, 0, 1000000];
output = [0, 0, 0, 0];
for i = 1 : scale_steps
    scale_p = scale_para^(i-1);
    original_object = imresize(original_object, scale_p);
    hog_scene = vl_hog(original_scene, cellsize, 'verbose');
    hog_object = vl_hog(original_object, cellsize, 'verbose');
    result = hogConvolution(hog_scene, hog_object, cellsize);
    if (1/scale_p)^5*result(5) < min(5)
        min = result;
    end
end

output = min(1:4);
end

