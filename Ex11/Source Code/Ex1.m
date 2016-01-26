clear;

%% Load an image
test_image = imread('test_image.png');

%% Convert to grayscale
grayscale_test_image = rgb2gray(test_image);

%% Convert to doubles 
test_image = double(test_image);
grayscale_test_image = double(grayscale_test_image);

%% Extract 60x60 templates
template_x = 350; template_y = 140;
color_template = test_image(template_y:(template_y + 59),(template_x):(template_x + 59),:); %looks a little strange when not viewed by channel
grayscale_template = grayscale_test_image(template_y:(template_y + 59),(template_x):(template_x + 59)); 

%% Score the grayscale image directly
[score_SSD_gray, score_NCC_gray] = scoreImage(grayscale_template, grayscale_test_image);

%% Score average the scores of the color channels
[score_SSD_r, score_NCC_r] = scoreImage(color_template(:,:,1),test_image(:,:,1));
[score_SSD_g, score_NCC_g] = scoreImage(color_template(:,:,2),test_image(:,:,2));
[score_SSD_b, score_NCC_b] = scoreImage(color_template(:,:,2),test_image(:,:,2));

score_SSD_color = (score_SSD_r + score_SSD_g + score_SSD_b)./3;
score_NCC_color = (score_NCC_r + score_NCC_g + score_NCC_b)./3;