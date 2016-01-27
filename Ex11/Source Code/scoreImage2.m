function [ score_EM ] = scoreImage2( Oxy_template, Oxy_image )
%SCOREIMAGE scores the template over the image with EM
%   Returns matrices of scores corresponding to the top-left position of
%   the template in the image. 

    [y_size, x_size] = size(Oxy_template);
    %% Initialize score matrices
    score_EM = zeros(size(Oxy_image) - size(Oxy_template));

    %% Loop over the image, compute scores
    for y=1 : size(score_EM,1)-1
        for x=1 : size(score_EM,2)-1
            score_EM(y,x) = scoreEM(Oxy_image(y:y+y_size-1,x:x+x_size-1), Oxy_template);
        end
    end
end

