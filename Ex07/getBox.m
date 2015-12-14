function out = getBox( points )
%GETBOX Gets the position of a bounding box for a set of points
x = min(points(1,:));
y = min(points(2,:));

w = max(points(1,:)) - min(points(1,:));
h = max(points(2,:)) - min(points(2,:));

out = [x,y,w,h];
end

