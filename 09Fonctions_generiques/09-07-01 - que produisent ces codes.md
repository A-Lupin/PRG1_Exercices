# Auto et généricité

Que produit le code suivant. S'il y a une ligne fautive, la supprimer au préalable.


~~~cpp
#include<iostream>
using namespace std;

auto minimum(auto a, auto b) {
  static int v;
  cout << v++ << ' ' << &a << ' ' << &v << endl;
  return a < b ? a : b;
}

int main() {
  auto texte = "Bonjour", txt = "Madame";
  string s1 = "bonjour", s2 = "monsieur";
  
  cout << minimum(texte, txt) << endl;
  cout << minimum(texte, s1) << endl;
  cout << minimum(s1, s2) << endl;
  cout << minimum(s1, txt) << endl;
  cout << minimum(texte, txt) << endl;
  cout << minimum(texte, s1).size() << endl;
//  cout << minimum(texte, txt).size() << endl;
}
~~~

<details>
<summary>Solution</summary>

------------------------------------------------
</details>

La dernière ligne est incorrecte, car le type de retour est `const char *` qui n'a pas de méthode `size()`.

~~~cpp
0
Madame
0
Bonjour
0
bonjour
0
Madame
1
Madame
1
7
~~~

Il y a donc 4 fonctions crées par le compilateur:

~~~cpp
const char* minimum(const char *, const char *);
string minimum(const char *, string);
string minimum(string, const char *);
string minimum(string, string);
~~~

À noter que l'opérateur `<` est défini pour les adresses et que le compilateur a placé `txt` à une 

<details>
<summary>Solution</summary>

`3 / 3.5`

- l'appel `somme<int>  (a, b)` fait la somme en `int`   => 1 + 2 = 3
- l'appel `somme<float>(a, b)` fait la somme en `float` => 1.0f + 2.5f = 3.5f

------------------------------------------------
</details>

~~~cpp
// no 4
template <typename T>
T somme(T a, T b) {
   return (a + b);
}

int main() {
   int  a = 1;
   char d = 'd'; // d vaut 100
   cout << somme<char>(d, a) << " / " << somme<int>(d, a);
}
~~~

<details>
<summary>Solution</summary>

`e / 101`

- l'appel `somme<char>(d, a)` fait la somme en `char`<br>
    100 + 1 = 100 en entier à cause du `+` => promotion en `int`<br>
    et retourne ceci dans T qui est un `char` => 'e';
- l'appel `somme<int>(d, a)`  fait la somme en `int ` => 100 + 1 = 101

------------------------------------------------
</details>

~~~cpp
// no 5
template <typename T1, typename T2>
T1 somme(T1 a, T2 b) {
   return (a + (T1)b);
}

int main() {
   int   a = 1;
   float b = 2.5f;
   cout << somme(a, b) << " / " << somme(b, a);
}
~~~

<details>
<summary>Solution</summary>

`3 / 3.5`

- l'appel `somme(a, b)` utilise `int` pour `T1` et `float` pour `T2`
	- la somme se fait en int (`int` comme reçu et `float` casté en  `int`)
	- le résultat `3` est transmis en valeur de retour de type `int`
- l'appel `somme(b, a)` utilise `float ` pour `T1` et `int` pour `T2`
	- la somme se fait en `float`
	- le résultat `3.5` est transmis en valeur de retour de type `float`

------------------------------------------------
</details>

~~~cpp
// no 6
template <typename T1, typename T2>
T1 somme(T1 a, T2 b) {
   return (a + b);
}

template <typename T>
T somme(T a, T b) {
   return (a + b + 1);
}

int main() {
   int   a = 1;
   float b = 2.5f;
   cout << somme(a, a) << " / "
        << somme(b, a) << " / "
        << somme(a, b) << " / "
        << somme(b, b);
   return 0;
}
~~~

<details>
<summary>Solution</summary>

`3 / 3.5 / 3 / 6`

Il y a surcharge de la fonction *somme(..)* générique

1. `template <typename T1, typename T2> T1 somme(T1 a, T2 b)`
1. `template <typename T> T1 somme(T a, T b)`

<br>

- l'appel `somme(a, a)` avec (`int`, `int`) va appeler `T somme(T a, T b)` instancié en `int somme(int, int)`et retourner `1 + 1 + 1 = 3`
- l'appel `somme(b, a)` avec (`float`, `int`) va appeler `T1 somme(T1 a, T2 b)` instancié en `float somme(float, int)` et retourner `2.5f + (float)1 = 3.5f` en `float`
- l'appel `somme(a, b)` avec (`int`,`float`) va appeler `T1 somme(T1 a, T2 b)` instancié en `int somme(int, float)`et retourner `(float)1 + 2.5f = 3.5f` casté en `int`, soit `3`
- l'appel `somme(b, b)` avec (`float`, `float`) va appeler `T somme(T a, T b)` instancié en `float somme(float, float)` et retourner `2.5f + 2.5f + (float)1 = 6.f`


------------------------------------------------
</details>


