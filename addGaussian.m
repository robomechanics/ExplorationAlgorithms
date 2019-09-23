function z = addGaussian(x,y,z,magnitude,mu,sigma)
[rows, columns] = size(x);
x = x(:);
y = y(:);
zAdd = magnitude * mvnpdf([x y],mu,sigma);
zAdd = reshape(zAdd,rows,columns);
z = z+zAdd;
end