function perturbations = perturbParams( ref_params, scale, number_perturbations )
%PERTURBPARAMS generates some perturbations of the reference parameters

perturbations = (2*scale).*rand(size(ref_params,1),number_perturbations) - scale;


end

