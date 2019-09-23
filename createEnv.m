function createRandomHotspotEnv()
numX = 1000;
numY = 1000;
x = linspace(-10,10,numX);
y = linspace(-10,10,numY);

end

[x,y] = meshgrid(x,y);
z = zeros(size(x));

z = addGaussian(x,y,z,500,[0,0],[5 0; 0 5]);
z = addCircleSmoothed(x,y,z,15,[4.75,5],0.75,2);
z = addPolygonSmoothed(x,y,z,15,[-8 -8 -6 -6], [-8 -6 -6 -8],3);





