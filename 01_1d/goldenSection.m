function [x, it] = goldenSection(f, a0, b0, eps, itMax)

c = 0.38197;

x1 = a0 + c*(b0-a0);
x2 = a0 + b0 - x1;

for it = 1:itMax
   if(abs(a0-b0)<eps)
       break
   end
   
   if(f(x1)<f(x2))
       % a0 ostaje
       b0 = x2;
       x2 = x1;
       x1 = a0 + b0 - x2;
   elseif(f(x2)<f(x1))
       a0 = x1;
       % b0 ostaje
       x1 = x2;
       x2 = a0 + b0 - x1;
   end
end

if(f(x1)<f(x2))
    x = x1;
else
    x = x2;
end

end