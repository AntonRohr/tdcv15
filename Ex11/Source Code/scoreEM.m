function score = scoreEM( Oxy_patch, Oxy_template )
%Given an image patch and an equally sized template, returns a match score
%by normalized sum of absolute cosines of the angle differences. 
    norm_para = sum(sum(Oxy_template < 100));
    invalid_pixel_num =  size(Oxy_template,1) * size(Oxy_template,2) - norm_para;
    valid_pixels = Oxy_template < 100;
    valid_patch = valid_pixels .* Oxy_patch;
    valid_template = valid_pixels .* Oxy_template;
    score = (sum(sum(abs(cos(valid_patch - valid_template)))) - invalid_pixel_num) / norm_para;
end

