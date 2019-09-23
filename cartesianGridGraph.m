function A = cartesianGridGraph(nx,ny)
% creates binary adjacency matrix for a cartesian grid graph that is nx
% nodes wide and ny nodes tall. Each node has a self loop
A = eye(nx*ny);
forback = true;
timeCount = 0;
for i = 0:nx-1
    for j = 1:ny
        if i ~= 0
            A(i*nx+j,(i-1)*nx+j) = 1;
        end
        if i ~= nx-1
            A(i*nx+j,(i+1)*nx+j) = 1;
        end
        if j ~= 1
            A(i*nx+j,i*nx+(j-1)) = 1;
        end
        if j ~=nx
            A(i*nx+j,i*nx+(j+1)) = 1;
        end
        if forback
            index = i*nx+j;
        else
            index = i*nx+ny+1-j;
        end
        timeCount = timeCount+1;
    end
    forback = ~forback;
end
end

