# Tri générique (compilation séparée)

Reprise de l'exercice [09-06-03 - tri generique.md](./09-06-03%20-%20tri%20generique.md)

Soient les tabeaux déclarés

~~~cpp
vector v      {6, 2, 8, 7, 1, 3};
array  a      {"chien"s, "chat"s, "souris"s, "poisson"s};
double t[ ] = {6.1, 2.2, 8.3, 7.4, 1.5, 3.6};
~~~

Trier ces tableaux en utilisant le tri par *sélection*.<br>
Les tableaux seront affichés avant et après le tri par le programme principal.

**Les sous-programmes utiles au tri seront placés dans un fichier séparé 'tri.tpp'**.

~~~
[6, 2, 8, 7, 1, 3]
[1, 2, 3, 6, 7, 8]

[chien, chat, souris, poisson]
[chat, chien, poisson, souris]

[6.1, 2.2, 8.3, 7.4, 1.5, 3.6]
[1.5, 2.2, 3.6, 6.1, 7.4, 8.3]
~~~

<details>
<summary>Solution - main</summary>

~~~cpp
#include <iostream>
#include <vector>
#include <array>
#include "tri.tpp"

using namespace std;

template <typename T>
void afficher(const T & t, size_t n) {
   cout << "[";
   for (size_t i = 0; i < n; ++i) {
      if (i) cout << ", ";
      cout << t[i];
   }
   cout << "]" << endl;
}

int main() {
   vector v      {6, 2, 8, 7, 1, 3};
   size_t n = v.size();
   afficher(v, n); tri(v, n); afficher(v, n);
   
   array<string,4>  a{{"chien"s, "chat"s, "souris"s, "poisson"s}};
   n = a.size();
   afficher(a, n); tri(a, n); afficher(a, n);
   
   double t[] = {6.1, 2.2, 8.3, 7.4, 1.5, 3.6};
   n = sizeof t / sizeof(double);
   afficher(t, n); tri(t, n); afficher(t, n);
}
~~~

</details>


<details>
<summary>Solution - Tri.tpp</summary>

~~~cpp
#ifndef TRI_TPP
#define TRI_TPP

#include <utility>  // std::swap
// À noter: ne pas mettre using namespace std;

template <typename T>
size_t indice_min(const T & t, size_t debut, size_t fin) {
   size_t i_min = debut;
   for (size_t i = debut + 1; i < fin; ++i)
      if (t[i] < t[i_min])
         i_min = i;
   return i_min;
}

template <typename T>
void tri(T & t, size_t n) {
   for(size_t i = 0; i < n-1; ++i) {
      size_t i_min = indice_min(t, i, n);
      std::swap(t[i], t[i_min]);
   }
}

#endif
~~~

</details>
