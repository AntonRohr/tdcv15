figure;
plot([resultSSDGray(:,3),resultSSDRGB(:,3),resultNCCGray(:,3),resultNCCRGB(:,3),resultEMRGB(:,3)]);

legend('SSD Gray','SSD RGB','NCC Gray','NCC RGB','EM RGB');
%axis([0,size(resultSSDGray,1),0,5]);