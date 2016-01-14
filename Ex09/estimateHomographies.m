function homographies = estimateHomographies( reference_params, perturbations )
%estimateHomographies Estimates homographies between reference params and
%random perturbations

homographies = cell(1,size(perturbations,2));

for i = 1:size(perturbations,2)
    
    homographies{i} = estimateHomography(reference_params, perturbations(:,i));

end

end

