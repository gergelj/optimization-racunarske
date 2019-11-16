## Newton's method

```math
x_k+1 = x_k - df(x_k) / ddf(x_k)
```
df je prvi izvod funkcije f
ddf je drugi izvod funkcije f

f mora biti dva puta neprekidno diferencijabilna.

Koraci algoritma:

0. Određuje se tačka x_0, k=0
1. Određuje se naredna tačka pomoću formule
2. Proverava se kriterijum zaustavljanja `|x_k - x_k+1| < epsilon`
	- ako je zadovoljen, kraj algoritma (x\_k+1 je optimum)
	- ako nije, prelazimo u korak 1.

## Secant method

Metoda sečice aproksimira vrednost drugog izvoda u tački pomoću prvog izvoda.

```math
ddf(x_k) = ( df(x_k) - df(x_k-1) ) / ( x_k - x_k-1 )
```
I dalje se rešava kao Njutnova metoda.

## General direct search method

Pretpostavlja se da je funkcija **unimodalna**.

Koraci algoritma:

0. Određujemo interval [a, b] nad kojim tražimo minimum
1. Nad [a, b] odaberemo tačke x1 i x2
2. 
	- `f(x1)<f(x2)`
		+ eliminišemo interval [x2, b]
		+ i novo *b* će biti x2
	
	- `f(x2)<f(x1)`
		+ eliminišemo interval [a, x1]
		+ i novo *a* će biti x1
	
	- `f(x1)=f(x2)`
		+ izaberemo novu x1 i x2
		
3. Redukovanje intervala dok se ne zadovolji kriterijum zaustavljanja.

## Fibonacci search

Fibonačijeva metoda se odnosi na direktno pretraživanje u smislu odabira tačaka x1 i x2.

1. Određuje se broj iteracija.

```math
Fn > |b0 - a0| / eps > Fn-1
```

n - broj iteracija
eps - tolerancija

2. Odrediti x1 i x2

```math
x1 = a0 + (Fn-2 / Fn) * (b0 - a0)
```

```math
x2 = a0 + b0 - x1
```

3. 
	- `f(x1)<f(x2)`
		+ a1 = a0
		+ b1 = x2
		+ x2 = x1
		+ x1 = b1 + a1 - x2
	
	- `f(x2)<f(x1)`
		+ a1 = x1
		+ b1 = b0
		+ x1 = x2
		+ x2 = b1 + a1 - x1

## Golden-section search

```math
Fn-2 / Fn = c = 0.38197
```

Kriterijum zaustavljanja:

```math
|b-a| < eps
```

```math
x1 = a0 + c * (b0 - a0)
```

```math
x2 = a0 + b0 - x1
```




























