function [ result ] = templateMatching( template, image, powerFunc, resultFunc, scale, searchWinTL, searchWinBR)
%SSD Summary of this function goes here
%   Detailed explanation goes here

% scale images
template = imresize(template, scale);
image = imresize(image, scale);

% scale search window
searchWinTL = max(round(searchWinTL * scale), [1,1]);

disp('');
searchWinBR = min(round(searchWinBR * scale), size(image(:,:,1)));

% setup score data matrix
scoreImgTL = searchWinTL;
scoreImgBR = searchWinBR - size(template(:,:,1));
scoreImg = zeros(scoreImgBR-scoreImgTL);


for row = 1:size(scoreImg, 1)
    for col = 1:size(scoreImg, 2)
       
        cPos = [row,col] + scoreImgTL; % cPos = currentPos in real image
        
        % extract region of interest from image;
        roiImg = image(cPos(1):cPos(1)+size(template,1)-1,cPos(2):cPos(2)+size(template,2)-1,:);

        scoreImg(row,col) = powerFunc(template, roiImg);
        
        
    end   
end


% find resulting position, using resultFunc
result = resultFunc(scoreImg);

result = result + searchWinTL; % move into actual position

result = round(result / scale); % scale back;


end

