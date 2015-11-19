function [ integralImage ] = createIntegralImage ( image )

integralImage = zeros(size(image));

for channel = 1:size(image, 3)
	for row = 1:size(image, 1)
		for col = 1:size(image,2)
			integralImage(row, col, channel) = sum(image(1:row, 1:col, channel));
		end
	end
end


end