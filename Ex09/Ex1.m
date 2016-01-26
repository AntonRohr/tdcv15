clear all; clc; close all;
% We first train some linear prediction matrices


%% Load the reference image
reference_image = double(imread('seq\im000.pgm'));

%% Normalize the reference image and add a little noise
%reference_norm = normalizeImage(reference_image);

%% Initialize the template parameters 
p_ref = [
         200, 230 ... % upper-left
         300, 230 ... % upper-right
         300, 330 ... % lower-right
         200, 330 ... % lower-left
        ]';

%% Initialize the sampling grid coordinates
grid_ref = initGrid(200,300,230,330);

%% Sample the template from the reference image and normalize
ref_intensities = zeros(size(grid_ref,2),1);
for i = 1:size(grid_ref,2)
    ref_intensities(i,1) = reference_image(grid_ref(2,i),grid_ref(1,i));
end
ref_intensities = ref_intensities - mean(ref_intensities);
ref_intensities = ref_intensities./std(ref_intensities);

%% Compute random pertubations
number_perturbations = size(grid_ref,2)*3; %n = # grid points

%Sorry about hardcoded values here
As = zeros(8,441,10);
for i = 10:-1:1
    scale = 3*i;
    perturbations = perturbParams(p_ref, scale, number_perturbations);

    %% Compute homographies based on pertubations
    homographies = estimateHomographies(p_ref, perturbations);

    %% Compute the intensity deltas for each pertubation
    intensity_deltas = computeIntensityDeltas(reference_image, ref_intensities, grid_ref, homographies);

    %% Compute the matrix A
    A = perturbations * intensity_deltas' * inv(intensity_deltas*intensity_deltas');
    As(:,:,i) = A;
end

%% Prepare images
path='.\seq\';
files=dir(fullfile(path,'*.pgm'));

%% Compute homographies over the sequence
grid_ref = grid_ref';
% Init deltas to zero, apply each matrix 5 times
p_deltas = zeros(size(p_ref)); applications = 5; template_position = p_ref;
params = p_deltas;

H = eye(3);
for t = 1:30
    % Read in the target image
    target = double((imread(strcat(path, files(t).name))));
    for a = size(As,3):-1:1
        for m = 1:applications

            %Backwarp the template    
            backwarped_grid = H*[grid_ref(:,1),grid_ref(:,2),ones(size(grid_ref,1),1)]';
            backwarped_grid = backwarped_grid';
            backwarped_grid = backwarped_grid./repmat(backwarped_grid(:,3),1,3);
            backwarped_grid = backwarped_grid(:,1:2);
    
            %Sample the warped template
            sample = interp2(1:size(target,2),1:size(target,1),target, ...
            backwarped_grid(:,1),backwarped_grid(:,2),'linear',0);
        
            %Normalize the sample
            if min(sample) == max(sample) && max(sample) == 0
                sample = zeros(size(sample));
            else
                sample = sample - mean(sample);
                sample = sample./std(sample);
            end
            
            %Compute the intensity deltas
            i_deltas = sample - ref_intensities;
            
            %Multiply by the precomputed linear transform
            A = As(:,:,a);
            p_deltas = A*i_deltas;
            params = p_deltas;
            
            %Render the resulting current estimation of the template position
            % template_position = p_ref + params;
            
            H_u = estimateHomography(p_ref,params);
            homogeneous_ref = [paramsToCoords(p_ref);ones(1,4)];
            updated_position = H*H_u*homogeneous_ref;
            updated_position = [updated_position(1,:)./updated_position(3,:); ...
                updated_position(2,:)./updated_position(3,:)];
            
            updated_position = updated_position(:);
            H = H*H_u;
            template_position = updated_position;
       
                
            imagesc(target);axis image; axis off; colormap(gray);
            hold on;
            plotQuad(template_position, 'r');
            hold off
            drawnow();
            
        end
    end    
end
