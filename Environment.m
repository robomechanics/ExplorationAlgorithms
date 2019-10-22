classdef Environment
    %Generate an environment
    
    properties
        numHotSpots
        hotSpotRadiis
        hotSpotCenters
        numObstacles
        %obstacleSizes
        %obstacleCenters
        x %width
        y %height
        z %depth of distribution/density
        grid
        
    end
    
    methods
        function obj = Environment(x,y, rangeX, rangeY, numHotSpots) %, hotSpotRadiis, hotSpotCenters)
            %Constructer
            %obj.x = linspace(rangeX(1),rangeX(2),x); %create x evenly spaced points from rangeX(1) to rangeX(2)
            %obj.y = linspace(rangeY(1),rangeY(2),y); %create y evenly space points from rangeY(1) to rangeY(2)
            obj.x = x;
            obj.y = y;
            obj.numHotSpots = numHotSpots;
            %obj.hotSpotRadiis = hotSpotRadiis;
            %obj.hotSpotCenters = hotSpotCenters;
            %create base environment
            obj.grid = meshgrid(x,y); %fill in the rest of the grid from the x,y axis, should be of form [x,y]
            if numHotSpots > 0
                [x,y,z] = createRandomHotspot(obj, numHotSpots, rangeX, rangeY);
                obj.z = z;
                obj.x = x;
                obj.y = y;
            end
        end
        
        function [x,y,z] = createRandomHotspot(obj, numHotSpots,rangeX,rangeY)
            %create base environment
            x = linspace(rangeX(1),rangeX(2),obj.x); %create numX evenly spaced points from rangeX(1) to rangeX(2)
            y = linspace(rangeY(1),rangeY(2),obj.y); %cyreate a y vector with a specified length
            [x,y] = meshgrid(x,y); %fill in the rest of the grid from the x,y axis

            z = zeros(size(x)); %create a matrix for hotspots
            for i = 1:numHotSpots
                hotspotCenter = [rangeX(1)+rand*(rangeX(2)-rangeX(1)),rangeY(1)+rand*(rangeY(2)-rangeY(1))];
                hotspotR1 = min(range(rangeX),range(rangeY))*0.1*rand;
                hotspotR2 = (1+5*rand)*hotspotR1;
                z = addCircleSmoothed(x,y,z,30,hotspotCenter,hotspotR1,hotspotR2);
            end
        end
        
%         function createRandomObstacle(obj,numObstacles,rangeX,rangeY) %void return as it should just add ontop of already created environ
%             %METHOD1 Summary of this method goes here
%             %   Detailed explanation goes here
%             z = zeros(size(obj.x)); %create a matrix for hotspots
%             for i = 1:numHotSpots
%                 hotspotCenter = [rangeX(1)+rand*(rangeX(2)-rangeX(1)),rangeY(1)+rand*(rangeY(2)-rangeY(1))];
%                 hotspotR1 = min(range(rangeX),range(rangeY))*0.1*rand;
%                 hotspotR2 = (1+5*rand)*hotspotR1;
%                 z = addCircleSmoothed(obj.x,obj.y,z,30,hotspotCenter,hotspotR1,hotspotR2);
%             end
%         end
    end
end

