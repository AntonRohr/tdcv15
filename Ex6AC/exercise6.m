% create 4 random points and their "correspondances"
x = randi(200,2,4);
xp = [ x(:,1)-40  x(:,2)-20  x(:,3)-30  x(:,4)-40 ];


H = dlt(x,xp);