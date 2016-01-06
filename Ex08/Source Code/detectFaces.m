function [detected resp_img] = detectFaces( int_image, classifiers )
%Returns an array of x,y coordinates where faces were detected

detected = cell(0);
resp_img = zeros(size(int_image));

%Sliding window size
win_width = 19; win_Height = 19;

%Sum of the alphas in the classifiers
sum_alphas = sum(classifiers(11,:));

%% Slide the window over the integral image
for j = 1 : (size(int_image,1) - win_Height)
    for i = 1 : (size(int_image,2) - win_width)
        %% Run each classifier over the image in the window
        sum_responses = 0;
        for c = 1:size(classifiers,2)
            response = weaklyClassify(classifiers(:,c), ...
            int_image(j:(j+win_Height -1), i:(i+win_width -1)));
            sum_responses = sum_responses + response;
        end
        resp_img(j,i) = sum_responses;
        if(sum_responses >= 0.7*sum_alphas)
            detected{1, size(detected,2) +1} = [i;j;sum_responses];
        end
    end
end


end

