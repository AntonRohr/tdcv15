function [trees, leaves]= getAllTrees()

trees = {};
leaves = {};
file_prename = 'Tree';
file_ext = '.txt';

for i = 1 : 10
    filename = strcat(file_prename, int2str(i-1));
    filename = strcat(filename, file_ext);
    [trees{i}, leaves{i}] = readTree(filename);
end

end

