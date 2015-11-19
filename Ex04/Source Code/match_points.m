function [matches_1, matches_2] = match_points( f1, f2, matches )
%MATCH_POINTS Summary of this function goes here
%   Detailed explanation goes here

matches_1 = [f1(1,matches(1,:));f1(2,matches(1,:))];
matches_2 = [f2(1,matches(2,:));f2(2,matches(2,:))];
end

