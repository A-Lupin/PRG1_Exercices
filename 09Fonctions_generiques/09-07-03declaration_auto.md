# Auto et généricité

Que produit le code suivant. S'il y a une ligne fautive, la supprimer au préalable.


~~~cpp
#include<iostream>
using namespace std;

auto minimum(auto a, auto b) {
  static int v;
  cout << v++ << ' ' << &v << endl;
  return a < b ? a : b;
}

int main() {
  auto texte = "Madame", txt = "Bonjour";
  string s1 = "bonjour", s2 = "Monsieur";
  
  cout << &texte << ' ' << &txt << ' ' << (texte < txt) << endl << endl;
  
  cout << minimum(texte, txt) << endl;
  cout << minimum(texte, s1) << endl;
  cout << minimum(s1, s2) << endl;
  cout << minimum(s1, txt) << endl;
  cout << minimum(texte, txt) << endl;
  cout << minimum(texte, s1).size() << endl;
  cout << minimum(texte, txt).size() << endl;
}
~~~

<details>
<summary>Solution</summary>

------------------------------------------------

La dernière ligne est incorrecte, car le type de retour est `const char *`, qui n'a pas de méthode `size()`.

Une fois supprimée, l'affichage peut être le suivant. Pour cette exécution, l'adresse à laquelle a été placée `texte` est plus petite que celle de `txt`, indépendemment de son contenu.

~~~cpp
0x7ffccac7b0c0 0x7ffccac7b0c8 1

0 0x5cb2462d5160
Madame
0 0x5cb2462d515c
Madame
0 0x5cb2462d5158
Monsieur
0 0x5cb2462d5154
Bonjour
1 0x5cb2462d5160
Madame
1 0x5cb2462d515c
6

~~~

Il y a donc 4 fonctions crées par le compilateur et également 4 variables statiques `v`.
Les deux première fonctions sont appelées 2 fois.

~~~cpp
const char* minimum(const char *, const char *);
string minimum(const char *, string);
string minimum(string, const char *);
string minimum(string, string);
~~~

À noter que l'opérateur `<` est défini pour les adresses et les `string`, mais seulement avec les 2 opérandes de même type.
Le type `string` a un constructeur à partir d'un `const char*` ce qui permet une conversion implicite de `const char*` vers `string` et une comparaison lexicographique avec l'opérateur `<`.

</details>


