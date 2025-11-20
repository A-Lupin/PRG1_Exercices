# Affichage d'un triangle

Écrire un programme qui lit un nombre entier `n` à la console et qui affiche un triangle d'étoile sur `n` lignes, la dernière comportant `n` étoiles.
Le programme ne doit comporter qu'une seule boucle `for`.
Exemple, avec la valeur de 6 introduite:

~~~
*
**
***
****
*****
******
~~~

<details>
<summary>Solution</summary>

~~~cpp
#include<iostream>
#include<iomanip>

using namespace std;
int main() {
  int n;
  cin >> n;
  for (int i = 1; i <= n; ++i)
    cout << setw(i) << setfill('*') << "" << endl;
}
~~~
</details>

