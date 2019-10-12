function [x,y,z] = createRandomHotspotEnv(numHotSpots,rangeX,rangeY,numX,numY)
%create base environment
x = linspace(rangeX(1),rangeX(2),numX); %create a x vector with a specified length
y = linspace(rangeY(1),rangeY(2),numY); %create a y vector with a specified length
[x,y] = meshgrid(x,y); %fill in the rest of the grid from the x,y axis

z = zeros(size(x)); %create a matrix for hotspots
for i = 1:numHotSpots
    hotspotCenter = [rangeX(1)+rand*(rangeX(2)-rangeX(1)),rangeY(1)+rand*(rangeY(2)-rangeY(1))];
    hotspotR1 = min(range(rangeX),range(rangeY))*0.1*rand;
    hotspotR2 = (1+5*rand)*hotspotR1;
    z = addCircleSmoothed(x,y,z,30,hotspotCenter,hotspotR1,hotspotR2);
end
end