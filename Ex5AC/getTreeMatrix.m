function [ treeMatrix, leafMatrix ] = getTreeMatrix( fileName )
%GETTREEMATRIX Summary of this function goes here
%   Detailed explanation goes here

fileID = fopen(fileName);

%% get treeMatrix from file

% get the node number (must convert string to number)
nodeNumber = str2double(fgetl(fileID));

% create matrix to save the entries to
treeMatrix = zeros(0,11);

% convert each line of the textfile to a vector and fill the treeMatrix
%
% fgetl iterates through the opened textfile line by line in this loop and 
% returns the line as a string
%
% str2num converts the string to a row vector
for x = 1:nodeNumber
    treeVector = str2num(fgetl(fileID));
    treeMatrix(end+1,:) = treeVector;
end

%% get leafMatrix from textfile

% get the number of leafs
leafNumber = str2double(fgetl(fileID));

% create leafMatrix
leafMatrix = zeros(0,3);

% iterate to the end of the list and fill the matrix
for y = 1:leafNumber
   leafVector = str2num(fgetl(fileID))
   leafMatrix(end+1,:) = leafVector;
end


% close file after reading
fclose(fileID);

end

