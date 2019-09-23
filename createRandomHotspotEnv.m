function [x,y,z] = createRandomHotspotEnv(numHotSpots,rangeX,rangeY,numX,numY)
x = linspace(rangeX(1),rangeX(2),numX);
y = linspace(rangeY(1),rangeY(2),numY);
[x,y] = meshgrid(x,y);
z = zeros(size(x));
for i = 1:numHotSpots
    hotspotCenter = [rangeX(1)+rand*(rangeX(2)-rangeX(1)),rangeY(1)+rand*(rangeY(2)-rangeY(1))];
    hotspotR1 = min(range(rangeX),range(rangeY))*0.1*rand;
    hotspotR2 = (1+5*rand)*hotspotR1;
    z = addCircleSmoothed(x,y,z,30,hotspotCenter,hotspotR1,hotspotR2);
end
end