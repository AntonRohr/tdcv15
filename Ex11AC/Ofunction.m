function [ outputImg ] = Ofunction( rgbImg, t )
%O Summary of this function goes here
%   Detailed explanation goes here

[Gmag1,Gdir1] = imgradient(rgbImg(:,:,1));
[Gmag2,Gdir2] = imgradient(rgbImg(:,:,2));
[Gmag3,Gdir3] = imgradient(rgbImg(:,:,3));

outputImg = zeros(size(Gmag1));

for i = 1:size(Gmag1(:))
	maxGrad = max(Gmag1(i),Gmag2(i));
    maxGrad = max(maxGrad,Gmag3(i));
	if maxGrad <= t
		outputImg(i) = 10000; % false value
    elseif Gmag1(i) == maxGrad
    	outputImg(i) = Gdir1(i);
    elseif Gmag2(i) == maxGrad
    	outputImg(i) = Gdir2(i);
    else
    	outputImg(i) = Gdir3(i);
	end
    	
end

end

