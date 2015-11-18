function [ pm_1, pm_2 ] = pruneMatches( matches_1, matches_2 )
%PruneMatches Uses estimateGeometricTransform to prune outlier matches

[tform,pm_1,pm_2] = estimateGeometricTransform(matches_1',matches_2','affine');

%Dear matlab, please for the love of god be consistent in something, love
%Anton. 


pm_1 = pm_1';
pm_2 = pm_2';

end

