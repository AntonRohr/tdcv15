function detected = detectFaces( int_image, classifiers )
%Returns an array of x,y coordinates where faces were detected

detected = cell(0);

%Sliding window size
winWidth = 19; winHeight = 19;

%Sum of the alphas in the classifiers
sum_alphas = sum(classifiers(11,:));

%% Slide the window over the integral image
for j = 1 : (size(int_image,1) - winHeight)
    for i = 1 : (size(int_image,2) - winWidth)
        %% Run each classifier over the image in the window
        sum_responses = 0;
        for c = 1:size(classifiers,2)
            response = weaklyClassify(classifiers(:,i), ...
            int_image(j:(j+winHeight -1), i:(i+winWidth -1)));
            sum_responses = sum_responses + response;
        end
        if(sum_responses > 0.5*sum_alphas)
            detected{1, size(detected,2) +1} = [i;j;sum_responses];
        end
    end
end


end

