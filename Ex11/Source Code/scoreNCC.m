function score = scoreNCC( patch, template )
%Given an image patch and an equally sized template, returns a match score
%by sum NCC.

    sum_of_products = sum(sum(patch.*template));
    sum_squares_patch = sum(sum(patch.^2));
    sum_squares_template = sum(sum(template.^2));

    score = sum_of_products / (sum_squares_patch*sum_squares_template);
end

