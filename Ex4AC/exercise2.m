

readImages;

scene = imresize(test_pot1, 0.25);
obj = imresize(pot, 0.25);
output = hogMatching(obj, scene);

imshow(output);