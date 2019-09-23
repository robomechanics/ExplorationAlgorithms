% how many nodes wide/ tall the map is
numX = 1000;
numY = 1000;
% Create x-y map
x = linspace(-10,10,numX);
y = linspace(-10,10,numY);
[x,y] = meshgrid(x,y);

% z value is distribution value
z = zeros(size(x));
% add a gaussian distribution to distribution
z = addGaussian(x,y,z,500,[0,0],[5 0; 0 5]);
% add shapes that are smoothed out to the distribution
z = addCircleSmoothed(x,y,z,15,[4.75,5],0.75,2);
z = addPolygonSmoothed(x,y,z,15,[-8 -8 -6 -6], [-8 -6 -6 -8],3);