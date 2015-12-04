function TransformMatrix = normalizationMatrix(points)

%TODO: refine and understand scaling factor s

meanu = mean(points(1,:));
meanv = mean(points(2,:));
sum = 0

for u = 1:size(points,2)
        sum = sum + sqrt((points(1,u) - meanu)^2 + (points(2,u) - meanv)^2);
end

s = sqrt(2)*size(points,1) / sum;

TransformMatrix = s * [ 1 0 -mean( points(1,:) ) ; 0 1 -mean( points(2,:) ) ; 0 0 1/s ];

end