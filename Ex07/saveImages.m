function saveImages(sequence, inliers_0, inliers_i)
%SAVEIMAGES �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

for i = 2 : 45
    plotMatches(sequence(:,:,1),sequence(:,:,i),inliers_0{i}, inliers_i{i});
    saveas(gcf,strcat('./img_results/',int2str(i)),'png');
end

