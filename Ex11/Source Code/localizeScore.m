function [ x_pos, y_pos ] = localizeScore( score )
%LOCALIZESCORE given a score map, find the most likely location of the
%template

    minScore = min(score(:));
    [y_pos,x_pos] = find(score==minScore);

end

