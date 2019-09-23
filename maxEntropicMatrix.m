% finds maxentropic transition matrix. NOT Constrained by stationary dist
function P = maxEntropicMatrix(A)
[eigVec,eigVal] = eigs(sparse(A));
eigVec = eigVec(:,1);
eigVal = eigVal(1,1);
P = 1/eigVal*(diag(eigVec))^-1*A*diag(eigVec);
end