# Références

Coder en C++ les questions suivantes

**NB** : les instructions sont dépendantes les unes des autres

1) Créer une variable `var1` initialisée 1

<details>
<summary>Réponse</summary>

`int var1 = 1;`

</details>

2) Créer une référence `ref1` sur `var1`

<details>
<summary>Réponse</summary>

`int& ref1 = var1;`

</details>

3) Créer une référence `ref2` non initialisée

<details>
<summary>Réponse</summary>

Pas possible, une référence est toujours initialisée

</details>

4) Passer la valeur de `var1` à 2

<details>
<summary>Réponse</summary>

`var1 = 2;` ou bien `ref1 = 2;` puisque `ref1` et `var1` sont synonymes

</details>

5) Passer la valeur de `ref1` à 3

<details>
<summary>Réponse</summary>

`ref1 = 3;` ou bien `var1 = 3;`

</details>

6) Afficher la valeur de `var1`

<details>
<summary>Réponse</summary>

`cout << var1; // => 3`

</details>

7) Afficher la valeur de `ref1`

<details>
<summary>Réponse</summary>

`cout << ref1; // => 3` 

</details>

8) À quoi correspond la déclaration de `ref1`

<details>
<summary>Réponse</summary>

`int* const ref1b = &var1;` La correspondance n'est toutefois pas exacte car pour modifier la valeur 
de `var1` en passant par `ref1b` il faut écrire avec cette déclaration `*ref1b = ...` (ce qui est possible) et non simplement `ref1 = ...` comme avec la déclaration 2). `const` qualifie en principe ce qui vient juste avant (ici *, donc le pointeur et non l'entier vers lequel il pointe).

</details>

9) À quoi correspond la déclaration d'une référence constante

<details>
<summary>Réponse</summary>

`const int* const refCste = &var1;` La correspondance n'est toutefois pas exacte, car pour accéder à la valeur vers laquelle `refCste` pointe, on doit écrire `*refCste`; voir le programme suivant qui compile:

~~~cpp

int main() {
  int var1;
  int &ref1 = var1;
  var1 = 2;
  ref1 = 3;
  int * const ref1b = &var1;
  *ref1b = 4; // Modifie la valeur de var1 à 4
  int const * const refCste = &var1;
  var1 = 2**refCste; // Modifie la valeur de var1 à 8;         
                     // Le premier * est la multiplication, le second le déréférencement
}

~~~

</details>

