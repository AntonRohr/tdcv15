% create 4 random points and their "correspondances" and apply DLT
%% 1) uniform translation
x1 = randi(200,2,4);
xp1 = [ x1(:,1)-40  x1(:,2)-40  x1(:,3)-40  x1(:,4)-40 ];


H1 = dlt(x1,xp1);
H1 = H1 / H1(3,3)

xp1
homo_xp1 = H1 * [ x1 ; ones(1,size(x1,2)) ]

%% 2) no change in the points
x2 = randi(200,2,4);
xp2 = [ x2(:,1)  x2(:,2)  x2(:,3)  x2(:,4) ];

H2 = dlt(x2,xp2);
H2 = H2/ H2(3,3)

xp2
homo_xp2 = H2 * [ x2 ; ones(1,size(x2,2)) ]

%% 3) random changes
x3 = randi(200,2,4);
xp3 = [ x3(:,1)+10  x3(:,2)+25  x3(:,3)+50  x3(:,4)+80 ];

H3 = dlt(x3,xp3);
H3 = H3 / H3(3,3)

xp3
homo_xp3 = H3 * [ x3 ; ones(1,size(x3,2)) ];
homo_xp3 = homo_xp3(:,:) ./ repmat(homo_xp3(3,:),3,1) 
