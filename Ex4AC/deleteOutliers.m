function [ outList1, outList2 ] = deleteOutliers( list1, list2 )
%DELETEOUTLIERS Summary of this function goes here
%   Detailed explanation goes here

%TODO rewrite using euclidean distance

distList = abs(list1(1:2,:) - list2(1:2,:));

med = median(distList(1,:)) + median(distList(2,:));

outList1 = zeros(size(list1,1),0);
outList2 = zeros(size(list2,1),0);

for i = 1:size(distList, 2)
   
    val = distList(1,i) + distList(2,i);
    
    if (val*100/med) < 103 && (val*100/med) > 97
        outList1(:,end+1) = list1(:,i);
        outList2(:,end+1) = list2(:,i);
    end
    
end


end

