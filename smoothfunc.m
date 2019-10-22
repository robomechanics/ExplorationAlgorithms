function f = smoothfunc(t)
f = zeros(size(t)); %matrix
f(t>0) = exp(-1./t(t>0)); %connects two points in an infinitely smooth curve
end