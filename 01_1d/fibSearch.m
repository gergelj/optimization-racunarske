function [x, n] = fibSearch(f, a0, b0, eps)

h = abs(a0-b0) / eps;
n = 0;
for i=2:100
   if(h>fibonacci(i-1) && h<fibonacci(i)) 
       n = i;
   end
end

x1 = a0 + fibonacci(n-2)/fibonacci(n) * (b0-a0);
x2 = b0 + a0 - x1;

for i = 1:n
    if(f(x1)<f(x2))
        % a0 ostaje
        b0 = x2;
        x2 = x1;
        x1 = a0 + b0 - x2;
    elseif(f(x1)>f(x2))
        a0 = x1;
        % b0 ostaje
        x1 = x2;
        x2 = a0+b0-x1;
    end
end

if(f(x1)<f(x2))
    x = x1;
else
    x = x2;
end

end