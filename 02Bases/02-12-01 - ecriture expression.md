# Expressions arithmétiques

Écrire des expressions, uniquement avec des opérateurs arithmétiques, qui permettent de déterminer si un nombre *n* entier non négatif:
- est impair (l’expression vaut 1 si $n$ impair, 0 sinon)
- est pair
- est un multiple de 3
<details>
<summary>Solution</summary>
 
~~~cpp

n%2

1-n%2 // Une autre solution serait (n+1)%2

(n+1)%3%2

~~~

