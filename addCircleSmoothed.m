function z = addCircleSmoothed(x,y,z,magnitude,center,r1,r2)
[rows, columns] = size(x);
x = x(:);
y = y(:);
zAdd = zeros(size(y));
t = sqrt((x-center(1)).^2 + (y-center(2)).^2); %distance to the center .^2 is a mapping
zAdd = magnitude*smoothfunc(r2-t)./(smoothfunc(r2-t)+smoothfunc(t-r1));
zAdd = reshape(zAdd,rows,columns); %goes from column vectors to matrix
z = z+zAdd; %makes it 3D
end