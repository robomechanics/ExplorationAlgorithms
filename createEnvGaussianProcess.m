% kernel (covariance function)
kernel = 1;
switch kernel
    case 1; k = @(x,y) 1*x'*y;
end

% points to sample at
points = linspace(0,1,100)';
[U,V] = meshgrid(points,points);
x = [U(:),V(:)]';
n = size(x,2);

% construct covariance matrix
% C = zeros(n,n);
% for i = 1:n
%     for j = 1:n
%         C(i,j) = k(x(:,i),x(:,j));
%     end
% end

C = generateSPDmatrix(n);

% sample from the gaussian process at these points
u = randn(n,1);
[A,S,B] = svd(C);
z = A*sqrt(S)*u;

% plot
Z = reshape(z,sqrt(n),sqrt(n));
surf(U,V,Z)

function A = generateSPDmatrix(n)
% Generate a dense n x n symmetric, positive definite matrix

A = rand(n,n); % generate a random n x n matrix

% construct a symmetric matrix using either
A = 0.5*(A+A');
% The first is significantly faster: O(n^2) compared to O(n^3)

% since A(i,j) < 1 by construction and a symmetric diagonally dominant matrix
%   is symmetric positive definite, which can be ensured by adding nI
A = A + n*eye(n);

end