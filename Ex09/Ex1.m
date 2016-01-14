clear all; clc; close all;
% We first train some linear prediction matrices


%% Load the reference image
reference_image = double(imread('seq\im000.pgm'));

%% Initialize the template parameters 
p_ref = [
         200, 230 ... % upper-left
         300, 230 ... % upper-right
         200, 330 ... % lower-left
         300, 330 ... % lower-right
        ]';

%% Initialize the sampling grid coordinates
grid_ref = initGrid(200,300,230,330);

%% Compute random pertubations
number_perturbations = size(grid_ref,2) + 40; %n = # grid points
scale = 3;
perturbations = perturbParams(p_ref, scale, number_perturbations);

%% Compute homographies based on pertubations
homographies = estimateHomographies(p_ref, perturbations);

%% Compute the intensity deltas for each pertubation
intensity_deltas = computeIntensityDeltas(reference_image, grid_ref, homographies);

%% Compute the matrix A
A = perturbations * intensity_deltas' * inv(intensity_deltas*intensity_deltas');