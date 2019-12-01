function [x, fx] = steepestDescent(f, x0, gamma, eps, itMax)

gnorm = inf;
x = x0;

for it = 1:itMax
    if gnorm <= eps
        break
    end
    
    gnorm = norm(grad(x));
    
    x = x - gamma*grad(x);
    
end

fx = f(x(1), x(2));

end