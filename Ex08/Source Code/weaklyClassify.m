function response = weaklyClassify( params, int_image )

%% Feature Params
r = params(1); c = params(2);
winWidth = params(3); winHeight = params(4);

%% Classifier Params
class_type = params(5); class_mean = params(6);
maxPos = params(8); minPos = params(9);
R = params(10); alpha = params(11);

%% Extract the feature conditional on the type

if(class_type == 1)
    r1 = extractFeature(r,c,(winWidth/2) -1, winHeight -1, int_image);
    r2 = extractFeature(r, c+(winWidth/2), (winWidth/2) -1, winHeight -1, int_image);
    feature_response = r1 + r2;
elseif(class_type == 2)
    r1 = extractFeature(r,c, winWidth -1, (winHeight/2) -1, int_image);
    r2 = extractFeature(r + (winHeight/2), c, winWidth -1, (winHeight/2) - 1, int_image);
    feature_response = r1 + r2;
elseif(class_type == 3)
    r1 = extractFeature(r, c, (winWidth/3) - 1, winHeight -1, int_image);
    r2 = extractFeature(r, c + (winWidth/3), (winWidth/3) -1, winHeight -1, int_image);
    r3 = extractFeature(r, c + ((2*winWidth)/3), (winWidth/3) -1, winHeight -1, int_image);
    feature_response = r1 - r2 + r3;
elseif(class_type == 4)
    r1 = extractFeature(r, c, winWidth -1, (winHeight/3) - 1, int_image);
    r2 = extractFeature(r + (winHeight/3), c , winWidth-1, (winHeight/3) -1, int_image);
    r3 = extractFeature(r + ((2*winHeight)/3), c, winWidth-1, (winHeight/3) -1, int_image);
    feature_response = r1 - r2 + r3;
elseif(class_type == 5)
    r1 = extractFeature(r, c, (winWidth/2) -1, (winHeight/2) -1, int_image);
    r2 = extractFeature(r, c+(winWidth/2), (winWidth/2) -1, (winHeight/2) -1, int_image);
    r3 = extractFeature(r+(winHeight/2), c, (winWidth/2) -1, (winHeight/2) -1, int_image);
    r4 = extractFeature(r+(winHeight/2), c+(winWidth/2), (winWidth/2) -1, (winHeight/2) -1, int_image);
    feature_response = r1 - r2 + r3 - r4;
else
    response = 0;
    return;
end

%% Compute the thresholds
thresh_low = class_mean - abs(class_mean - minPos) * (R -5) / 50; 
thresh_high = class_mean + abs(maxPos - class_mean) * (R -5) /50;

if (feature_response >= thresh_low && feature_response <= thresh_high)
    response = alpha;
else
    response = -alpha;
end

end

