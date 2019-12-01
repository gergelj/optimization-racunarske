function [x, f, cnt] = HookJeev( fun, x0, d, dmin )
% Metoda HOOK-JEEVES za minimizaciju f-je više promenljivih bez ograničenja

% fun -funkcija cilja
% x0 -početno pogađanje;  d -početni korak;  dmin -krajnja dužina koraka (uslov zaustavljanja)

% x -izračunat minimum; f -vrednost u minimumu; cnt -broj poziva fun

n = length(x0);     % broj promenljivih
e = eye(n) * d;     % pravci kretanja -ose
x = x0; f = feval(fun,x);   % prva bazna tačka
cnt = 1;            % broj izračunavanja f-je cilja

while e(1,1) > dmin     % glavna petlja (traje dok je korak veći od dmin)
    t = x;              % tekuća tačka
    for i=1:n           % po svim promenljivim (po svim osama)
        % pozitivan smer
        z = t + e(:,i);
        y = feval(fun,z);
        cnt=cnt+1;
        
        if y < f
            t = z;
            f = y;      % prihvata se (“-“ smer se onda ne razmatra)
        else
            % negativan smer
            z = t - e(:,i);
            y = feval(fun,z);
            cnt=cnt+1;
            if y < f
                t = z;
                f = y;  % prihvata se
            end
        end
    end                 % ako oba smera “ne uspeju” uzima se sledeća osa
    
if all(t==x)            % tekuća tačka se nije pomerila iz bazne tačke...
    e = e * 0.5;        % te se smanjuje korak
else
    % skok u pravcu “spuštanja terena” -probam
    x1 = t + (t-x);
    y1 = feval(fun,x1);
    cnt=cnt+1;
    x = t;              % x=nova bazna tačka, ako skok ne uspe
    
    if y1 < f
        % skok delimično uspeo, još se traži prva tačka u okolini x1 gde je f(z) manje nego u tački x
        for i=1:n       % po svim koordinatama
            % pozitivan smer
            z = x1 + e(:,i);
            y = feval(fun,z);
            cnt=cnt+1;
            
            if y < y1
                x = z;
                f = y;
                break;  % bingo, nova bazna tačka, iskačem iz for petlje
            end
            
            % negativan smer (ovde se ne stiže ako “uspe pozitivan smer”)
            z = x1 - e(:,i);
            y = feval(fun,z);
            cnt=cnt+1;
            
            if y < y1
                x = z;
                f = y;
                break;  % bingo, imam baznu tačku
            end
        end             % ako ni jedan od pravaca (osa) ne daje bolje...
                        % rešenje od tačke x, ona postaje nova bazna tačka
    end
end
end                     % kraj glavne petlje