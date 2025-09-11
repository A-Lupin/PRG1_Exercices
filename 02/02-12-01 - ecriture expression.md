# Expressions arithmétiques

Écrire des expressions, uniquement avec des opérateurs arithmétiques, qui permettent de déterminer si :
- un nombre 'n' entier non négatif est impair (l’expression vaut 1 si $n$ impair, 0 sinon)
<details>
<summary>Solution</summary>
 
~~~cpp

n%2

~~~

- un nombre 'n' entier est pair
<details>
<summary>Solution</summary>
 
~~~cpp

1-n%2

~~~

- un nombre 'n' entier non négatif est un multiple de 3

<details>
<summary>Solution</summary>

~~~cpp

(n+2)%3%2

~~~

