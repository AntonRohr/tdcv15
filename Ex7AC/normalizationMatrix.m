function TransformMatrix = normalizationMatrix(points)

meanu = mean(points(1,:));
meanv = mean(points(2,:));
sum = 0;

for u = 1:size(points,2)
        sum = sum + sqrt((points(1,u) - meanu)^2 + (points(2,u) - meanv)^2);
end

% calculate scaling factor s
s = sqrt(2)*size(points,1) / sum;

% construct Transformation Matrix
TransformMatrix = s * [ 1 0 -meanu ; 0 1 -meanv ; 0 0 1/s ];

end