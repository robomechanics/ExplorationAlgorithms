function x = phiInverse(A,statDist)
A = sparse(A);
n = length(A); % number of nodes in A

%Calculate ksi and eta
ksi = 0;
eta = 0;
for i = 1:n
    ksiTemp = A(i,:)*statDist;
    etaTemp = A(i,:)*sqrt(statDist);
    ksi = max(ksi,ksiTemp);
    eta = max(eta,etaTemp);
end
x = statDist/sqrt(ksi); % initial x
xlast = x+1; % last x
% iterate until x has converged
while max(abs(x-xlast)) > 10^-8
    xlast = x;
    x = x-inv(sparse(diag(x))*A+sparse(diag(A*x)))*(sparse(diag(x))*A*x-statDist);
end
end