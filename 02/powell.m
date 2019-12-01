function[x,it]=powell(fun,x0,epsilon, itMax)
% Metoda Powell za minimizaciju f-je vise promenljivih bez ogranicenja
%  fun -funkcija cilja
%  x0 -pocetno pogadjanje
%  epsilon -uslov zaustavljanja

n = length(x0);     % broj promenljivih
p = eye(n);         % početni “konjugovani pravci” - koordinate prave za svaku promelnjivu

x = x0; x1 = x0+2*epsilon;  % x1 je vrednost iz predhodne iteracije
it = 0;             % broj iteracija

while max(abs(x-x1)) > epsilon  %sve dok je korak pomeraja u narednoj iteraciji nije manja od epsilon
    it = it+1;
    ti = x;         % tekuća tačka
    
    for i = 1:n     % po svim promenljivama racunamo optimum po pravcima
        teta = parabola(fun,p(:,i),ti,epsilon, itMax); % linijska pretraga
        ti = ti + teta*p(:,i);  % pomeranje u minimum na pravcu
    end
    
    p = [p(:,2:n) ti-x];    % prvi vektor ispada i dodaje se novi (umesto prvog pravca dodaje se konjugovani pravac)
    x1 = x;
    teta = parabola(fun,p(:,n),ti,epsilon, itMax); % n+1. pretraga (pretraga po novom konjugovanom pravcu), (umesto ti može x1)
    x = ti + teta*p(:,n);   % minimum, (umesto ti može x1)
end

%f = fun(x(1), x(2));