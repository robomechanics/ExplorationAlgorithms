% change to true if you want to write a video
doWriteVid = false
% setup video writing (look at Matlab documentation)
if doWriteVid
    v = VideoWriter('MonteCarlo')
    v.Quality = 100;
    open(v)
end

% Do certain number of iterations- look at Monte Carlo algo def: more
% iterations, more accuracy
iterations = 100;
for i = 1:iterations
    % create random enviornment
    %[x,y,z] = createRandomHotspotEnv(1,[-10 10],[-10 10],1000,1000);
%     env1 = Environment(1000,1000,[-10,10],[-10,10],1)
%     minX = min(min(env1.x));%parameters to send to Path function
%     maxX = max(max(env1.x));
%     minY = min(min(env1.y));
%     maxY = max(max(env1.y));
    
    %old way
    [x,y,z] = createRandomHotspotEnv(1,[-10 10],[-10 10],1000,1000, 2, [-10,10],[-10,10]);
    minX = min(min(x));%parameters to send to Path function
    maxX = max(max(x));
    minY = min(min(y));
    maxY = max(max(y));
    
    %which path would you like to run/simulate?
    % create lawn mower path
    [pathX, pathY] = lawnMowerPath([minX maxX minY maxY],3); %lawnMowerPath is a function in a different file (boundary, pathWidth)
    figure(1)
    clf
    set(gcf,'Color','w')
    
    subplot(1,2,1)
    set(gcf, 'Position',  [50, 50, 1500, 615])
    surf(x,y,z,'EdgeColor','none')
    hold on
    plot3(pathX,pathY,ones(size(pathX))*20,'LineWidth',3,'color','red','Marker','.','MarkerSize',40,'LineStyle','--');
    view([0 90])
    set(gca,'FontSize',20)
    colormap('default')
    axis([minX maxX minY maxY])
    axis equal
    caxis([min(min(z)) max(max(z))])
    
    subplot(1,2,2)
    hold on
    zSampled = interp2(x,y,z,pathX,pathY);
    
    xRecreate = linspace(-10,10,100);
    yRecreate = linspace(-10,10,100);
    [xRecreate,yRecreate] = meshgrid(xRecreate,yRecreate);
    zRecreate = griddata(pathX,pathY,zSampled,xRecreate,yRecreate);
    %zRecreate = RecreateLinearInterpolate(xRecreate,yRecreate,pathX,pathY,zSampled);
    surf(xRecreate,yRecreate,zRecreate,'EdgeColor','none')
    plot3(pathX,pathY,ones(size(pathX))*20,'LineWidth',3,'color','red','Marker','.','MarkerSize',40,'LineStyle','--');
    view([0 90])
    %set(gcf, 'Position',  [50, 50, 950, 900])
    set(gca,'FontSize',20)
    colormap('default')
    axis([minX maxX minY maxY])
    axis equal
    caxis([min(min(z)) max(max(z))])
    if doWriteVid
        writeVideo(v,getframe(gcf))
    end
    pause(0.1)
end
if doWriteVid
    close(v)
end
