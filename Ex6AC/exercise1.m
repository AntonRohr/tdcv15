% create 4 random points and their "correspondances"

% uniform translation
x = randi(200,2,4);
xp = [ x(:,1)-40  x(:,2)-40  x(:,3)-40  x(:,4)-40 ];


H1 = dlt(x,xp);
H1 = H1 / H1(3,3)

% no change in the points
x = randi(200,2,4);
xp = [ x(:,1)  x(:,2)  x(:,3)  x(:,4) ];

H2 = dlt(x,xp);
H2 = H2/ H2(3,3)

% random changes
x = randi(200,2,4);
xp = [ x(:,1)+10  x(:,2)+25  x(:,3)+50  x(:,4)+80 ];

H3 = dlt(x,xp);
H3 = H3 / H3(3,3)
