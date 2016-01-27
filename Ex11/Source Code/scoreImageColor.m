function [ score_SSD_color, score_NCC_color ] = scoreImageColor( color_template, test_image )
%SCOREIMAGECOLOR Performs template scoring on color image

[score_SSD_r, score_NCC_r] = scoreImageMono(color_template(:,:,1),test_image(:,:,1));
[score_SSD_g, score_NCC_g] = scoreImageMono(color_template(:,:,2),test_image(:,:,2));
[score_SSD_b, score_NCC_b] = scoreImageMono(color_template(:,:,2),test_image(:,:,2));

score_SSD_color = (score_SSD_r + score_SSD_g + score_SSD_b)./3;
score_NCC_color = (score_NCC_r + score_NCC_g + score_NCC_b)./3;


end

