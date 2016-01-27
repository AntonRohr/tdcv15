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
color = true;
%compute gradient magnitude
G_I_color = computeGxy(test_image,color);
G_T_color = computeGxy(color_template,color);
%compute gradient orientation
Oxy_I_color = computeOxy(G_I_color,1);
Oxy_T_color = computeOxy(G_T_color,1);
%compute the score image
score_image_color = scoreImage2(Oxy_T_color, Oxy_I_color);

%% compute the score of gray image
color = false;
G_I_gray = computeGxy(grayscale_test_image,color);
G_T_gray = computeGxy(grayscale_template,color);
Oxy_I_gray = computeOxy(G_I_gray,1);
Oxy_T_gray = computeOxy(G_T_gray,1);
score_image_gray = scoreImage2(Oxy_T_gray, Oxy_I_gray);
toc;