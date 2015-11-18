

readImages;

scene = imresize(test_pot1, 0.3);
obj = imresize(pot, 0.3);
output = hogMatching(obj, scene);

imshow(output);