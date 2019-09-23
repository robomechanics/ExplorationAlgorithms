v = VideoWriter('lawnMower')
v.Quality = 100;
v.FrameRate = 30;
open(v)
CreateEnv1
minX = min(min(x));
maxX = max(max(x));
minY = min(min(y));
maxY = max(max(y));
[pathX pathY] = lawnMowerPath([minX maxX minY maxY],3);

index = 1;
lengthAfterIndex = 0;
figure(1)
speed = 1;
while index < length(pathX)
    length2Next = sqrt((pathX(index+1)-pathX(index))^2+(pathY(index+1)-pathY(index))^2);
    lengthAfterIndex = (lengthAfterIndex+speed);
    if lengthAfterIndex >= length2Next
        lengthAfterIndex = lengthAfterIndex-length2Next;
        index = index+1;
    end
    if index < length(pathX)
        lastX = pathX(index) + lengthAfterIndex/length2Next*(pathX(index+1)-pathX(index));
        lastY = pathY(index) + lengthAfterIndex/length2Next*(pathY(index+1)-pathY(index));
        lineX = [pathX(1:index);lastX];
        lineY = [pathY(1:index);lastY];
    else
        lineX = pathX;
        lineY = pathY;
    end
    clf
    surf(x,y,z,'EdgeColor','none')
    hold on
    plot3(lineX,lineY,ones(size(lineX))*20,'LineWidth',3,'color','red','LineStyle','--');
    pointsX = [pathX(1:index)];
    pointsY = [pathY(1:index)];
    scatter3(pointsX,pointsY,ones(size(pointsX))*20,100,'red','filled');
    view([0 90])
    set(gcf, 'Position',  [50, 50, 950, 900])
    set(gca,'FontSize',20)
    colormap('jet')
    axis equal
    pause(0.01)
    writeVideo(v,getframe(gcf))
end
clf
surf(x,y,z,'EdgeColor','none')
hold on
plot3(pathX,pathY,ones(size(pathX))*20,'LineWidth',3,'color','red','Marker','.','MarkerSize',40,'LineStyle','--');
view([0 90])
set(gcf, 'Position',  [50, 50, 950, 900])
set(gca,'FontSize',20)
colormap('jet')
axis equal
writeVideo(v,getframe(gcf))
close(v);