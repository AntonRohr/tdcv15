function homographies = estimateHomographies( reference_params, perturbations )
%estimateHomographies Estimates homographies between reference params and
%random perturbations

homographies = cell(1,size(perturbations,2));

for i = 1:size(perturbations,2)
    ref_coords = paramsToCoords(reference_params)';
    perturbed_coords = paramsToCoords(reference_params + perturbations(:,i))';
    homographies{i} = normalized_dlt(ref_coords, perturbed_coords);
end

end

