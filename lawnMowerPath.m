function [pathX pathY] = lawnMowerPath(boundary,pathWidth)
minX = boundary(1);
maxX = boundary(2);
minY = boundary(3);
maxY = boundary(4);
numStrides = ceil((maxX-minX)/pathWidth);
startX = (maxX+minX)/2-(numStrides-1)/2*pathWidth;
endX = (maxX+minX)/2+(numStrides-1)/2*pathWidth;
numSamplesPerStride = ceil((maxY-minY)/pathWidth);
startY = (maxY+minY)/2-(numSamplesPerStride-1)/2*pathWidth;
endY = (maxY+minY)/2+(numSamplesPerStride-1)/2*pathWidth;

pathX = startX;
pathY = startY;
for i = 1:numStrides
    pathX = [pathX;ones(numSamplesPerStride-1,1)*pathX(end)];
    if pathY(end) == startY
        pathY = [pathY;(startY+pathWidth:pathWidth:endY)'];
    else
        pathY = [pathY;(endY-pathWidth:-pathWidth:startY)'];
    end
    pathX = [pathX;pathX(end)+pathWidth];
    pathY = [pathY;pathY(end)];
end
pathX(end) = [];
pathY(end) = [];
end