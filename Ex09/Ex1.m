clear all; clc; close all;
% We first train some linear prediction matrices


%% Load the reference image
reference_image = double(imread('seq\im000.pgm'));

%% Normalize the reference image and add a little noise
reference_norm = normalizeImage(reference_image);

%% Initialize the template parameters 
p_ref = [
         200, 230 ... % upper-left
         300, 230 ... % upper-right
         300, 330 ... % lower-rigt
         200, 330 ... % lower-left
        ]';

%% Initialize the sampling grid coordinates
grid_ref = initGrid(200,300,230,330);

%% Sample the template from the normalized reference image
ref_intensities = zeros(size(grid_ref,2),1);
for i = 1:size(grid_ref,2)
    ref_intensities(i,1) = reference_image(grid_ref(2,i),grid_ref(1,i));
end


%% Compute random pertubations
number_perturbations = size(grid_ref,2) + 40; %n = # grid points

%Sorry about hardcoded values here
As = zeros(10,8,441);
for i = 10:-1:1
    scale = 3*i;
    perturbations = perturbParams(p_ref, scale, number_perturbations);

    %% Compute homographies based on pertubations
    homographies = estimateHomographies(p_ref, perturbations);

    %% Compute the intensity deltas for each pertubation
    intensity_deltas = computeIntensityDeltas(reference_image, ref_intensities, grid_ref, homographies);

    %% Compute the matrix A
    A = perturbations * intensity_deltas' * inv(intensity_deltas*intensity_deltas');
    As(i,:,:) = A;
end