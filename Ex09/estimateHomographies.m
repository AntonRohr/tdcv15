function homographies = estimateHomographies( reference_params, perturbations )
%estimateHomographies Estimates homographies between reference params and
%random perturbations

homographies = cell(1,size(perturbations,2));

for i = 1:size(perturbations,2)
    ref_coords = paramsToCoords(reference_params)';
    perturbation_coords = paramsToCoords(reference_params + perturbations(:,i))';
    homographies{i} = estimateGeometricTransform(ref_coords, perturbation_coords, 'projective');
end

end

