v = VideoWriter('randomWalk')
v.Quality = 100;
v.FrameRate = 30;
open(v)
for i = 1:10:length(pathX)
    figure(1)
    clf
    surf(x,y,z,'EdgeColor','none')
    hold on
    pathPlot = plot3(pathX(1:i),pathY(1:i),ones(size(pathX(1:i)))*20,'LineWidth',3,'color','red');
    scatter3(pathX(i),pathY(i),20,100,'red','filled');
    pathPlot.Color(4) = 0.7;
    view([0 90])
    set(gcf, 'Position',  [50, 50, 950, 900])
    set(gca,'FontSize',20)
    colormap('parula')
    axis([-10 10 -10 10])
    axis equal
    drawnow
    writeVideo(v,getframe(gcf))
end
close(v)