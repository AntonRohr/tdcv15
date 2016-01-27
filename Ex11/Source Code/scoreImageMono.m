function [ score_SSD, score_NCC ] = scoreImageMono( template, image )
%SCOREIMAGE scores the template over the image with SSD and NCC
%   Returns matrices of scores corresponding to the top-left position of
%   the template in the image. 

    [y_size, x_size] = size(template);
    %% Initialize score matrices
    score_SSD = zeros(size(image) - size(template) - [1,1]); score_NCC = score_SSD;

    %% Loop over the image, compute scores
    for y=1 : size(score_SSD,1)
        for x=1 : size(score_SSD,2)
            score_SSD(y,x) = scoreSSD(image(y:y+y_size-1,x:x+x_size-1), template);
            score_NCC(y,x) = scoreNCC(image(y:y+y_size-1,x:x+x_size-1), template);
        end
    end
end

