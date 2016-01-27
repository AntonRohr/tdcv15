function score_EM = scoreImageGradient( template, image , color)
%SCOREIMAGE scores the template over the image with EM
%   Returns matrices of scores corresponding to the top-left position of
%   the template in the image. 
    G_I= computeGxy(image,color);
    G_T = computeGxy(template,color);
    Oxy_image = computeOxy(G_I,1);
    Oxy_template = computeOxy(G_T,1);

    [y_size, x_size] = size(template(:,:,1));
    %% Initialize score matrices
    score_EM = zeros(size(Oxy_image) - size(Oxy_template));

    %% Loop over the image, compute scores
    for y=1 : size(score_EM,1)-1
        for x=1 : size(score_EM,2)-1
            score_EM(y,x) = scoreEM(Oxy_image(y:y+y_size-1,x:x+x_size-1), Oxy_template);
        end
    end
end

