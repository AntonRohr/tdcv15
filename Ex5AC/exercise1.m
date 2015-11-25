
% read image
image = imread('2007_000032.jpg');


if exist('integrals') == 0
    integrals = createIntegralImage(image);
end

%mesh(integralImage(:,:,1));

% convert lists to matrices


if exist('treeMatrices') == 0
    treeMatrices = cell(1,10);
    leafMatrices = cell(1,10);
    for tree_id = 1:10
        name = ['Tree', num2str(tree_id-1) ,'.txt'];
        [treeMatrices{tree_id}, leafMatrices{tree_id}] = getTreeMatrix(name);
    end
end

votings = zeros(0,4);

heatmap = zeros(size(image, 1), size(image, 2));

progress = 0;
for row = 1:size(image,1)
    for col = 1:size(image, 2)
        leaf_x = 0;
        leaf_y = 0;
        for tree_id = 1:10
            leaf_id = treeRecursive([col, row], treeMatrices{tree_id}(1,:), integrals, treeMatrices{tree_id});
            leaf = leafMatrices{tree_id}(leaf_id+1,:);
             
            leaf_x = leaf_x + leaf(2);
            leaf_y = leaf_y + leaf(3);
        end
        centroid_x = round(leaf_x / 10) + col;
        centroid_y = round(leaf_y / 10) + row;
        
       
        heatmap(centroid_y, centroid_x) = heatmap(centroid_y, centroid_x) + 1;
       
        votings(end+1,:) = [col, row, centroid_x, centroid_y];
        
    end
    % print progress
    if round((row*100)/size(image,1)) > progress
        progress = progress+1;
        if mod(progress, 10) == 0
            fprintf('%d',progress);
        else
        fprintf('.');
        end
    end
end

maxHeatmapValue = max(heatmap(:));
tmp = heatmap;
tmp(tmp<maxHeatmapValue) = 0;
[row, col] = find(tmp);
row = row(1);
col = col(1);

image = drawCorners(image, [row, col]);

%imshow(image);

filteredVotings = zeros(0,4);
for i = 1:size(votings, 1)
    
    if (votings(i,3) == col) && (votings(i,4) == row)
        filteredVotings(end+1,:) = votings(i,:);
    end
end

image = drawLines(image, filteredVotings, 'blue');

imshowpair(image, heatmap, 'montage');

%imagesc(heatmap);