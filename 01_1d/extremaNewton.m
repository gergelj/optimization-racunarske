function [x, it] = extremaNewton(df, ddf, x0, errMax, itMax)

for it=1:itMax
    
    x = x0 - df(x0)/ddf(x0);
     if(abs(x-x0)<errMax)
         return
     end
     
     x0 = x;
end

end