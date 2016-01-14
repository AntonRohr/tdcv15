function H = estimateHomography( reference_params, deltas )
%ESTIMATEHOMOGRAPHY Summary of this function goes here
%   Detailed explanation goes here
    ref_coords = paramsToCoords(reference_params)';
    perturbed_coords = paramsToCoords(reference_params + deltas)';
    H = normalized_dlt(ref_coords, perturbed_coords);
end

