function output = gaussian2D( sigma )

size = 3*sigma;
mask = ones(3*sigma);

middle_point = ceil(size/2);

for i=1:size
    for j=1:size
        u = i - middle_point;
        v = j - middle_point;
        mask(i,j) = 1/(2*pi*sigma^2)*exp(-1/2*(u^2+v^2)/sigma^2);
    end

end

output = mask;

