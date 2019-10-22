function [x,y,heatMap] = createRandomHotspotEnv(numHotSpots,rangeX,rangeY,numX,numY, numObstacles, rangeObsX, rangeObsY) %change to createRandomHotspotEnv?
%create base environment
x = linspace(rangeX(1),rangeX(2),numX); %create numX evenly spaced points from rangeX(1) to rangeX(2)
y = linspace(rangeY(1),rangeY(2),numY); %create a y vector with a specified length
[x,y] = meshgrid(x,y); %fill in the rest of the grid from the x,y axis

heatMap = zeros(size(x)); %create a matrix for hotspots
for i = 1:numHotSpots
    hotspotCenter = [rangeX(1)+rand*(rangeX(2)-rangeX(1)),rangeY(1)+rand*(rangeY(2)-rangeY(1))];
    hotspotR1 = min(range(rangeX),range(rangeY))*0.1*rand;
    hotspotR2 = (1+5*rand)*hotspotR1;
    heatMap = addCircleSmoothed(x,y,z,30,hotspotCenter,hotspotR1,hotspotR2); %density covers entire map...
end

obs = zeros(size(x)); %create a matrix for obstacles
for j = 1:numObstacles
    obstacleCenter = [rangeX(1)+rand*(rangeX(2)-rangeX(1)),rangeY(1)+rand*(rangeY(2)-rangeY(1))];
    obstacleR1 = min(range(rangeObsX),range(rangeObsY))*0.1*rand;
   % obstacleR2 = (1+5*rand)*obstacleR1;
    obs = addCircle(x,y,z,10,obstacleCenter,obstacleR1); %(x,y,z,magnitude,center,radius)
  
end
    
% for i = 1:numObstacles
%     obstacleCenter = [rangeX(1)+rand*(rangeX(2)-rangeX(1)),rangeY(1)+rand*(rangeY(2)-rangeY(1))];
%     obstacleR1 = min(range(rangeObsX),range(rangeObsY))*0.1*rand;
%     obstacleR2 = (1+5*rand)*obstacleR1;
%     z = addCircleSmoothed(x,y,obs,30,obstacleCenter,obstacleR1,obstacleR2, true);
end
