function [t] = parabola(f, p, a, epsilon, itMax)

dim = length(p);

if dim==2
    fun = @(t) f(a(1)+t*p(1), a(2)+t*p(2));
elseif dim==3
    fun = @(t) f(a(1)+t*p(1), a(2)+t*p(2), a(3)+t*p(3));
elseif dim == 4
    fun = @(t) f(a(1)+t*p(1), a(2)+t*p(2), a(3)+t*p(3), a(4)+t*p(4));
else
    t = NaN;
    return
    %error: too many dimensions
end

t0 = 0;
syms ff(x1);
ff(x1) = fun(x1);
df = diff(ff, x1);
ddf = diff(df, x1);

df = matlabFunction(df);
ddf = matlabFunction(ddf);

for it = 1:itMax
    t = t0 - df(t0) / ddf(t0);
    if abs(t-t0)<epsilon
        break
    end
    t0 = t;
end

end