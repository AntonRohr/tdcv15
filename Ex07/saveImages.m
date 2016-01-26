function saveImages(sequence, inliers_0, inliers_i)
%SAVEIMAGES 此处显示有关此函数的摘要
%   此处显示详细说明

for i = 2 : 45
    plotMatches(sequence(:,:,1),sequence(:,:,i),inliers_0{i}, inliers_i{i});
    saveas(gcf,strcat('./img_results/',int2str(i)),'png');
end

