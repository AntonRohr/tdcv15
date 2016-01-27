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
[score_SSD_gray, score_NCC_gray] = scoreImageMono(grayscale_template, grayscale_test_image);

%% Score average the scores of the color channels
[score_SSD_color, score_NCC_color] = scoreImageColor(color_template, test_image);

%% Score the gradients
score_EM_gray = scoreImageGradient(grayscale_template, grayscale_test_image, false);
score_EM_color = scoreImageGradient(color_template, test_image, true);

%% Build pyramids for the template and the image
image_quarter = imresize(grayscale_test_image, 0.25);
template_quarter = imresize(grayscale_template, 0.25);

%Find the downsampled template in the downsampled image
[score_SSD_quarter, score_NCC_quarter] = scoreImageMono(template_quarter, image_quarter);
[x_quarter, y_quarter] = localizeScore(score_SSD_quarter);

%Search over the possible subregion instead of the full image 
subregion = grayscale_test_image((y_quarter-1)*4:(y_quarter*4)+59,(x_quarter-1)*4:(x_quarter*4)+59);
subregion_score = scoreImageMono(grayscale_template, subregion);
[x_subregion, y_subregion] = localizeScore(subregion_score);

pyramid_coords = [((y_quarter-1)*4), ((x_quarter-1)*4)] + [x_subregion, y_subregion];


%TODO: Plot examples
