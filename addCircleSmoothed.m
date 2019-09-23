function z = addCircleSmoothed(x,y,z,magnitude,center,r1,r2)
[rows, columns] = size(x);
x = x(:);
y = y(:);
zAdd = zeros(size(y));
t = sqrt((x-center(1)).^2 + (y-center(2)).^2);
zAdd = magnitude*smoothfunc(r2-t)./(smoothfunc(r2-t)+smoothfunc(t-r1));
zAdd = reshape(zAdd,rows,columns);
z = z+zAdd;
end