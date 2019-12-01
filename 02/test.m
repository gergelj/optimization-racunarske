%% inicijalizacija
clear
clc

%funkcija
f = @(x,y) (x-1).^2 + (x-1).*y + 3*y.^2 + 50;
%pocetna tacka
x0 = [10;420];
%tolerancija
epsilon = 0.0001;
%maximalni broj iteracija
itMax = 150;

%% gradijent

[xopt, fxopt] = steepestDescent(f, x0, 0.1, epsilon, itMax);

xopt
fxopt

[x,y] = meshgrid(-3:0.01:3);

contour(x,y,f(x,y)); hold on
scatter(xopt(1), xopt(2), 'red');
legend('f(x)', 'optimum'); hold off;

%% powell
[xopt] = powell(f, x0, epsilon, itMax);

xopt
f(xopt(1), xopt(2))

[x,y] = meshgrid(-3:0.01:3);

contour(x,y,f(x,y)); hold on
scatter(xopt(1), xopt(2), 'red');
legend('f(x)', 'optimum'); hold off;