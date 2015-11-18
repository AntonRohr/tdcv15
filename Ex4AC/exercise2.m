

readImages;

scene = imresize(test_shell4, 0.24);
obj = imresize(shell, 0.24);

%scene = padarray(scene, [40, 40], 'replicate', 'both');

output = hogMatching(obj, scene);

imshow(output);