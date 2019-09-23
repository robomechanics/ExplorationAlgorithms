% Creates an environment
CreateEnv1

% look at the variables created from CreateEnv1
minX = min(min(x));
maxX = max(max(x));
minY = min(min(y));
maxY = max(max(y));

% input dimensions of the environment to create lawn mower path
[pathX pathY] = lawnMowerPath([minX maxX minY maxY],3);

% plot actual environment overlayed with the lawn mower path
figure(1)
clf
surf(x,y,z,'EdgeColor','none')
hold on
plot3(pathX,pathY,ones(size(pathX))*20,'LineWidth',3,'color','red','Marker','.','MarkerSize',40,'LineStyle','--');
view([0 90])
set(gcf, 'Position',  [50, 50, 950, 900])
set(gca,'FontSize',20)
colormap('jet')
axis equal

% Take samples of the actual distribution at the path (x,y) position
zSampled = interp2(x,y,z,pathX,pathY);
% recreate the distribution by linearly interpolating between sampled
% points
xRecreate = linspace(-10,10,100);
yRecreate = linspace(-10,10,100);
[xRecreate,yRecreate] = meshgrid(xRecreate,yRecreate);
zRecreate = griddata(pathX,pathY,zSampled,xRecreate,yRecreate)
% plot recreation of distribution
figure(2)
clf
hold on
surf(xRecreate,yRecreate,zRecreate,'EdgeColor','none')
plot3(pathX,pathY,ones(size(pathX))*20,'LineWidth',3,'color','red','Marker','.','MarkerSize',40,'LineStyle','--');
view([0 90])
set(gcf, 'Position',  [50, 50, 950, 900])
set(gca,'FontSize',20)
colormap('jet')
axis equal
