# Tri générique (surcharge)

Reprise de l'exercice [09-06-03 - tri generique.md](./09-06-03%20-%20tri%20generique.md)

Soient les tableaux déclarés ainsi:

~~~cpp
   array a{6, 2, 9, 7, 1, 3};
   const vector<int> v2{66, 22, 99, 77, 11, 33};
   const vector<string> v3{"chien"s, "chat"s, "souris"s, "poisson"s};
~~~

Tout en étant capable de trier un **tableau non constant**, par exemple un *array*, écrire les fonctions permettant d'afficher les deux **`vector` constants** de manière triée.

⚠️ Les éléments stockés dans les vecteurs occupent potentiellement beaucoup de mémoire.

~~~
[6, 2, 9, 7, 1, 3]
[1, 2, 3, 6, 7, 9]

[6, 2, 9, 7, 1, 3]
[1, 2, 3, 6, 7, 9]

[chien, chat, souris, poisson]
[chat, chien, poisson, souris]
~~~

## Indices

1. Un vecteur constant ne peut pas être modifié.<br>
2. Copier un vecteur n'est pas une option du point de vue de l'utilisation de la mémoire.<br>
3. Nous pouvons créer un **vecteur de pointeurs** sur les éléments du vecteur constant à trier. Ce seront les pointeurs qui seront réorganisés pour voir les valeurs pointées de manière triée.

**NB** : Il n'est pas possible de créer un tableau de références, elles seraient d'ailleurs toujours associées au même élément. Un tableau d'itérateurs serait possible et même mieux, mais pas encore vu.

Vecteur constant de valeurs

|Indice|  0  |  1  |  2  |  3  |  4  |  5  |
|:----:|:---:|:---:|:---:|:---:|:---:|:---:|
| val  |  6  |   2 |  9  |  7  |  1  |  3  |
| adr  | 0x00| 0x04| 0x08| 0x0B| 0x0F| 0x14|

Vecteur de pointeurs

|Indice|  0  |  1  |  2  |  3  |  4  |  5  |
|:----:|:---:|:---:|:---:|:---:|:---:|:---:|
| val  | 0x0F| 0x04| 0x14| 0x00| 0x0B| 0x08|


<details>
<summary>Solution</summary>

Pour éviter de dupliquer le code des fonctions `afficher` et `indice_min` qui ne différeraient l'une et l'autre que part la manière dont elles interprètent 
la valeur d'un élément s'il est `T` ou `T*`, on surcharge 
une fonction `valeur` qui sera appelée par ces 2 fonctions. 

~~~cpp
#include <iostream>
#include <vector>
#include <array>

using namespace std;

template <typename T>
const T& valeur(T const& t) {
   return t;
}

template <typename T> // Permet d'éviter une duplication des codes de afficher et indice min
const T& valeur(T* t) {
   return *t;
}

template<typename T>
void afficher(const T & t) {
   cout << "[";
   for (size_t i = 0; i < t.size(); ++i) {
      if (i) cout << ", ";
      cout << valeur(t[i]);
   }
   cout << "]";
}

template<typename T>
size_t indice_min(const T & t, size_t debut) {
   size_t iMin = debut;
   for (size_t i = debut + 1; i < t.size(); ++i)
      if (valeur(t[i]) < valeur(t[iMin]))
         iMin = i;
   return iMin;
}

template<typename T>
void tri_par_selection(T & t) {
   for (size_t i = 0; i < t.size() - 1; ++i) {
      size_t imin = indice_min(t, i);
      swap(t[i], t[imin]);
   }
}

template<typename T>
vector<const T*> make_pointers_to_span_data(const vector<T> & v) {
   vector<const T*> w;
   w.reserve(v.size());
   for (const T& e: v) {
      w.push_back(&e);
   }
   return w;
}

int main() {
   array<int, 6> a{{6, 2, 9, 7, 1, 3}};

   afficher(a); cout << endl;
   tri_par_selection(a);
   afficher(a); cout << endl << endl;

   const vector<int> v2{66, 22, 99, 77, 11, 33};
   vector vp2 = make_pointers_to_span_data(v2);
   afficher(v2); cout << endl;
   tri_par_selection(vp2);
   afficher(vp2); cout << endl << endl;

   const vector<string> v3{"chien"s, "chat"s, "souris"s, "poisson"s};
   vector vp3 = make_pointers_to_span_data(v3);
   afficher(v3); cout << endl;
   tri_par_selection(vp3);
   afficher(vp3); cout << endl << endl;
}
~~~
</details>


