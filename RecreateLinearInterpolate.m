function z = RecreateLinearInterpolate(x,y,xSampled,ySampled,zSampled)
[rows,columns] = size(x);
x = x(:);
y = y(:);
xSampled = xSampled(:); ySampled = ySampled(:);
z = zeros(size(x));
for i = 1:length(x)
    distances = ((x(i)-xSampled).^2 + (y(i)-ySampled).^2).^(1/2);
    [~,indices] = sort(distances);
    p1 = [xSampled(indices(1));ySampled(indices(1));zSampled(indices(1))];
    p2 = [xSampled(indices(2));ySampled(indices(2));zSampled(indices(2))];
    p3 = [xSampled(indices(3));ySampled(indices(3));zSampled(indices(3))];
    normal = cross(p1-p2,p1-p3);
    d = p1(1)*normal(1) + p1(2)*normal(2) + p1(3)*normal(3);
    d = -d;
    z(i) = (-d - (normal(1)*x(i)) - (normal(2)*y(i)))/normal(3);
end
z = reshape(z,rows,columns);
% function RecreateLinearInterpolate(x,y,xSampled,ySampled,zSampled)
% [rows,columns] = size(x);
% x = x(:);
% y = y(:);
% numRecreate = length(x);
% xSampled = xSampled(:); ySampled = ySampled(:);
% numSampled = length(xSampled);
% xSampled = xSampled'; ySampled = ySampled';
% xMatrix = x*ones(1,numSampled);
% yMatrix = y*ones(1,numSampled);
% xSampledMatrix = ones(numRecreate,1)*xSampled;
% ySampledMatrix = ones(numRecreate,1)*ySampled;
% distances = ((xMatrix-xSampledMatrix).^2+(yMatrix-ySampledMatrix).^2).^2;
% [~,indices] = sort(distances,2);
% indices = indices(:,1:3);
% end