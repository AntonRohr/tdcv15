function [ oxy ] = computeOxy( gxy, thres )
%COMPUTEOXY compute orientation marix with threshold
[~, oxy] = imgradient(gxy);
oxy = oxy./180.*pi;
for i = 1 : size(gxy,1)
    for j = 1 : size(gxy,2)
        if gxy(i,j) <= thres
            oxy(i,j) = 100;
        end
    end
end

end

