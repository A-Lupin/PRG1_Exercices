# Reste de la division entière

Soient les déclarations suivantes :

~~~cpp
int i = 5, j = 11, n = 10;
double x = 5, y = 11;
~~~

Quel est le résultat d'évaluation des expressions suivantes ?\
En cas d'erreur, en indiquer la raison.\
**NB** : les questions sont indépendantes les unes des autres.

| # | Expression | Résultat |
|---| ---------- |---|
| 1 | `j % i` | |
| 2 | `n % i`  | |
| 3 | `y % x`  | |
| 4 | `y % i` | |
| 5 | `-j % i` | |
| 6 | `n % ++i` | |
| 7 | `n++ % ++i` | |


    

<details>
<summary>Solution</summary>

| # | Expression | Résultat |
|---| ---------- |---|
| 1 | `j % i` | 1 |
| 2 | `n % i`  | 0 |
| 3 | `y % x`  | Erreur, le reste de la division entière n'est pas défini pour les réels |
| 4 | `y % i` | Erreur, le reste n'est pas défini pour les réels |
| 5 | `-j % i` | -1 |
| 6 | `n % ++i` | 4 |
| 7 | `n++ % ++i` | 4 |


</details>
