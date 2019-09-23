function z = addCircle(x,y,z,magnitude,center,radius)
[rows, columns] = size(x);
x = x(:);
y = y(:);
zAdd = zeros(size(y));
distance2Center = sqrt((x-center(1)).^2 + (y-center(2)).^2);
zAdd(distance2Center<radius) = magnitude;
zAdd = reshape(zAdd,rows,columns);
z = z+zAdd;
end