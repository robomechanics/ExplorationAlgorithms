function z = addPolygonSmoothed(x,y,z,magnitude,xv, yv,offset)
[rows, columns] = size(x);
x = x(:);
y = y(:);
zAdd = zeros(size(y));
t = p_poly_dist(x, y, xv, yv);
zAdd = magnitude*smoothfunc(offset-t)./(smoothfunc(offset-t)+smoothfunc(t));
zAdd = reshape(zAdd,rows,columns);
z = z+zAdd;
end