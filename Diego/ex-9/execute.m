close all; clc;

if ~exist('A','var')
    clear all;
else  
    %Clear all except A
    clearvarlist = ['clearvarlist';setdiff(who,{'A';})];
    clear(clearvarlist{:});
end

images_path = './seq/';
image_prefix = 'im';
format = '.pgm';
do_plot = 0;

% Instead of x-y-width-height, we define rectangles by 4 x,y points, in
% order to work more easily with quadrangles. The dimension of the matrix
% is 4x2
rectangle_coord = [[200;300;300;200],[230;230;330;330]];

grid_density = 5;
number_samples = 5000;
numiter = 10;
number_iterations = 10;

% The first image of the sequence is used as template
image_path = sprintf('%s%s%03d%s',images_path, image_prefix, 0, format);
template_img = double(imread(image_path));

%Convert to grayscale if necessary
if(size(template_img, 3) == 3), template_img = rgb2gray(template_img);end 

% Create a grid from which to draw points
regionGrid = createGridQuadrangle(rectangle_coord, grid_density);

% Draw template intensities from the grid locations
template_intensities = [];
for m = 1:size(regionGrid,1)
   template_intensities = [template_intensities; template_img(regionGrid(m,2), regionGrid(m,1))];
end

% Normalize to mean 0 and std 1
template_intensities = (template_intensities-mean(template_intensities(:)))/std(template_intensities(:));

% Avoid recomputing. TODO: replace by file

if ~exist('A', 'var')
    if ~(exist('precomputed.mat', 'file')==2)
    
        A = zeros(number_iterations, 8, size(template_intensities, 1));

        % For each iteration, starting with the latest one
        for i = number_iterations:-1:1

            I = zeros(size(template_intensities,1), number_samples);
            P = zeros(8,number_samples);

            random_interval = 3*i;
            for s = 1:number_samples

                %Size of grid
                warpedQuadrangle = createRandomQuadrangle(rectangle_coord, 3*[-i,i]);

                % Homography computation
                H = normalized_dlt(rectangle_coord, warpedQuadrangle);

                backwarpedRegionGrid = [regionGrid(:,1),regionGrid(:,2),ones(size(regionGrid,1),1)]*inv(H)';
                backwarpedRegionGrid = backwarpedRegionGrid./repmat(backwarpedRegionGrid(:,3),1,3);
                backwarpedRegionGrid = backwarpedRegionGrid(:,1:2);

                S = interp2(1:size(template_img,2),1:size(template_img,1),template_img,backwarpedRegionGrid(:,1),backwarpedRegionGrid(:,2),'linear',0);  
                S = S+0.01*rand(size(S));
                I(:,s) = S - template_intensities;

                points_diff = warpedQuadrangle - rectangle_coord;
                P(:,s) = points_diff(:);
            end
            A(number_iterations-i+1,:,:) = (P*I')*inv(I*I');
        
        end
        save('precomputed', 'A');
    else
       load('precomputed', 'A');
    end
end

p_vector = zeros(8,1);
files=dir(fullfile(images_path,'*.pgm'));

times_application = 5;

for t = 1:length(files)
   
    I = double((imread(strcat(images_path, files(t).name))));
    
    for n = 1:size(A,1)
        
        for m = 1:times_application

            region_updated = rectangle_coord+reshape(p_vector,4,2);
            %tform = estimateGeometricTransform(rectangle_coord, region_updated, 'projective');
            
            H = normalized_dlt(rectangle_coord, rectangle_coord+reshape(p_vector,4,2));
            warpedRegionGrid = [regionGrid(:,1),regionGrid(:,2),ones(size(regionGrid,1),1)]*H';
            warpedRegionGrid = warpedRegionGrid./repmat(warpedRegionGrid(:,3),1,3);
            warpedRegionGrid = warpedRegionGrid(:,1:2);
                        
            S = interp2(1:size(I,2),1:size(I,1),I,warpedRegionGrid(:,1),warpedRegionGrid(:,2),'linear',0);  
            S = (S-mean(S(:)))/std(S(:));
            
            D = S-template_intensities;
            
            p_new = reshape(A(n,:,:),size(A,2),size(A,3))*D;
            
            % Update vector
            p_vector = p_vector+p_new;
                        
        end
    end
    
    %Visualize each step
    imagesc(I) 
    colormap(gray)
    axis image; axis off;
    hold on;
    plot_quadrangle((rectangle_coord+reshape(p_vector,4,2))', 'r');
    hold off
    drawnow();
    
end
