# Mêmes éléments

Écrire une fonction `meme_elements` qui reçoit deux séquences et retourne `true` si elles contiennent les même éléments et `false` dans le cas contraire.

- l'ordre n'a pas d'importance
- les valeurs à double sont possibles

Les deux conteneurs ci-dessous ont les même éléments

~~~cpp
   forward_list f {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
   vector v {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2};
~~~

<details>
<summary>Solution</summary>

~~~cpp
#include <iostream>
#include <algorithm>
#include <vector>
#include <forward_list>

using namespace std;

//---------------------------------------------------------
template <typename Iter1, typename Iter2>
bool meme_elements(Iter1 deb1, Iter1 fin1, Iter2 deb2, Iter2 fin2) {

   for (Iter1 i = deb1; i != fin1; ++i)
      if (find(deb2, fin2, *i) == fin2)
         return false;
   for (Iter2 i = deb2; i != fin2; ++i)
      if (find(deb1, fin1, *i) == fin1)
         return false;
         
   return true;
}

//---------------------------------------------------------
int main() {

   forward_list f {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
   vector v {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2};

   cout << meme_elements(f.begin(), f.end(), v.begin(), v.end()) << endl;
}
~~~

</details>
