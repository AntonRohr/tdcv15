function [ result ] = ssd( template, image, scale, searchWinTL, searchWinBR )
%SSD Summary of this function goes here
%   Detailed explanation goes here

% scale images
template = imresize(template, scale);
image = imresize(image, scale);

% scale search window
searchWinTL = max(round(searchWinTL * scale), [1,1]);
searchWinBR = min(round(searchWinBR * scale), size(image));

% setup score data matrix
scoreImgTL = searchWinTL;
scoreImgBR = searchWinBR - size(template);
scoreImg = zeros(scoreImgBR-scoreImgTL);

count = 0;
for row = 1:size(scoreImg, 1)
    for col = 1:size(scoreImg, 2)
       
        cPos = [row,col] + scoreImgTL; % cPos = currentPos in real image
        % extract region of interest from image;
        roiImg = image(cPos(1):cPos(1)+size(template,1)-1,cPos(2):cPos(2)+size(template,2)-1);

        diffMat = template - roiImg;
        diffMat = diffMat.^2;

        scoreImg(row,col) = sum(sum(diffMat));
        count = count + 1;
    end   
end
count
% find minimal value of score image
[resrow, rescol] = find(scoreImg==min(min(scoreImg)),1);
result = [resrow, rescol];

result = result + searchWinTL; % move into actual position

result = round(result / scale); % scale back;


end

