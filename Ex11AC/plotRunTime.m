figure;
plot([resultSSDGray(:,1),resultSSDRGB(:,1),resultNCCGray(:,1),resultNCCRGB(:,1),resultEMRGB(:,1)]);
legend('SSD Gray','SSD RGB','NCC Gray','NCC RGB','EM RGB');

figure;
plot([resultSSDGray(:,1),resultSSDRGB(:,1),resultNCCGray(:,1),resultNCCRGB(:,1),resultEMRGB(:,1)]);
legend('SSD Gray','SSD RGB','NCC Gray','NCC RGB','EM RGB');
axis([0,size(resultSSDGray,1),0,5]);