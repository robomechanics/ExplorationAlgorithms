numX = 1000;
numY = 1000;
x = linspace(-10,10,numX);
y = linspace(-10,10,numY);
[x,y] = meshgrid(x,y);
z = zeros(size(x));
z = addGaussian(x,y,z,500,[0,0],[10 0; 0 10]);

A = cartesianGridGraph(100,100);
nodesX = [-10:20/100:10]+20/200;
nodesX(end) = [];
nodesY = nodesX;
nodeLocX = [];
for i = 1:length(nodesX)
    nodeLocX = [nodeLocX ones(1,100)*nodesX(i)];
end
nodeLocY = [];
for i = 1:length(nodesY)
    nodeLocY = [nodeLocY nodesY];
end
statDist = griddata(x,y,z,nodeLocX,nodeLocY);
statDist = statDist/sum(statDist);
statDist = reshape(statDist,length(statDist),1);
xval = phiInverse(A,statDist);
P = capPhi(xval,A);

display('PCalculated')

path = 10000/2+50;

for i = 1:100000
    randVal = rand;
    prevLoc = path(end);
    nextLoc = 0;
    rowsum = 0;
    while rowsum < randVal
        nextLoc = nextLoc+1;
        rowsum = rowsum + P(prevLoc,nextLoc);
    end
    path = [path nextLoc];
end

pathX = nodeLocX(path)';
pathY = nodeLocY(path)';

figure(1)
clf
surf(x,y,z,'EdgeColor','none')
hold on
pathPlot = plot3(pathX,pathY,ones(size(pathX))*20,'LineWidth',3,'color','red');
pathPlot.Color(4) = 0.7;
view([0 90])
set(gcf, 'Position',  [50, 50, 950, 900])
set(gca,'FontSize',20)
colormap('parula')
axis([-10 10 -10 10])
axis equal
