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

%% compute the score of color image
tic;
score_EM_color = scoreImageGradient(color_template, test_image, true);

%% compute the score of gray image
score_EM_gray = scoreImageGradient(grayscale_template, grayscale_test_image, false);
toc;