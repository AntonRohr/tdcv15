function [ probDist ] = probMap( img_reg_H, values )

probDist = zeros(size(img_reg_H));
for i = 1 : size(img_reg_H, 1)
    for j = 1 : size(img_reg_H, 2)
        %calculate the index in histogram
        index = round(img_reg_H(i,j)*255) + 1;
        probDist(i,j) = values(index);
    end
end
%normalization
probDist = round(probDist .* (255/max(max(probDist))));
end

