function score = scoreSSD( patch, template )
%Given an image patch and an equally sized template, returns a match score
%by sum of squared differences. 

    score = sum(sum(((patch - template).^2)));

end

