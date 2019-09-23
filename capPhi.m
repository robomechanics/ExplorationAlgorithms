function result = capPhi(x,A)
A = sparse(A);
result = sparse(inv(sparse(diag(A*x))))*A*sparse(diag(x));
end