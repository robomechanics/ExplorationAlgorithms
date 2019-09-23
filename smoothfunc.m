function f = smoothfunc(t)
f = zeros(size(t));
f(t>0) = exp(-1./t(t>0));
end