# Višedimenzionalna optimizacija

## Gradijentni metod (Steepest Descent - SD)

1. Počinjemo od tačke `x0`.
2. U svakoj iteraciji računamo sledeći `x`:

```matlab
x = x - gamma*grad(x)
```

`gamma` je mali broj (`0.01 < gamma < 0.1`)
`grad(x)` je vrednost gradijenta u tački `x`.

Gradijent funkcije `f` je u posebnom fajlu `grad.m`.

3. Uslov zaustavljanja: `||grad(x)|| < epsilon`

## Pauelova metoda (Powell's method)

1. Inicijalizujemo početnu tačku `x0`.
2. Za svaki pravac izračunamo optimum (u prvom ciklusu postupak se svodi na jednodimenzionalnu optimizaciju po svakoj dimenziji, a kasnije ti pravci koji se poklapaju sa koordinatnim osama će biti zamenjeni konjugovanim pravcima).
3. Zamenjuje se poslednji pravac konjugovanim pravcem (`ti-x`)
4. Tražimo optimum (n+1. pretraga) po tim konjugovanim pravcem.
5. Kriterijum zaustavljanja: Kada korak između tačke posle n pretrage i tačke posle konjugovane pretrage opada ispod tolerancije.

> Napomena. Svaka pretraga je jednodimenzionalni problem. U `parabola.m` fajlu sam koristio Njutnovu metodu za traženje minimuma, ali poenta Pauelove metode je da funkcija ne mora da bude diferencijabilna.

## Other

U other folderu se nalaze kodovi za Huk-Dživs i Nelder-Mid algoritam.
