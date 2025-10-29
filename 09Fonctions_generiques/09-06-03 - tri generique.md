# Tri générique

Soient les tableaux déclarés

~~~cpp
vector v      {6, 2, 8, 7, 1, 3};
array  a      {"chien"s, "chat"s, "souris"s, "poisson"s};
double t[ ] = {6.1, 2.2, 8.3, 7.4, 1.5, 3.6};
~~~

Trier ces tableaux en utilisant le tri par *sélection*.<br>
Les tableaux seront affichés avant et après le tri par le programme principal.

~~~
[6, 2, 8, 7, 1, 3]
[1, 2, 3, 6, 7, 8]

[chien, chat, souris, poisson]
[chat, chien, poisson, souris]

[6.1, 2.2, 8.3, 7.4, 1.5, 3.6]
[1.5, 2.2, 3.6, 6.1, 7.4, 8.3]
~~~

<details>
<summary>Solution</summary>

Intéressons nous d'abord à fonction d'affichage. La solution la plus simple
consiste à utiliser le tableau comme type générique. `Tableau` pourra 
alors être déduit comme `vector<int>` ou `array<string, 4>` par exemple.

~~~cpp
template <typename Tableau>
void afficher(const Tableau& s) {
   cout << "[";
   for (size_t i = 0; i < s.size(); ++i) {
      if (i) cout << ", ";
      cout << s[i];
   }
   cout << "]" << endl;
}
~~~

Il faut noter que cela pose un problème lors de l'appel avec un tableau natif
en C, ces tableaux ne disposant pas de la méthode `.size()`. Comme le mécanisme 
de transmission ne passe qu'un pointeur vers le premier élément du tableau, une fonction ne peut pas connaître son nombre d'éléments.

~~~cpp
int main() {
   vector v      {6, 2, 8, 7, 1, 3};
   afficher(v);

   array  a      {"chien"s, "chat"s, "souris"s, "poisson"s};
   afficher(a);

   double t[6] = {6.1, 2.2, 8.3, 7.4, 1.5, 3.6};
   // afficher(t); ne compile pas car t.size(), utilisé par afficher(...), n'existe pas.
}
~~~

Une bonne pratique en C++ moderne est de se passer des tableaux natifs.
Pour cet exercice, une solution est de transmettre explicitement la taille du tableau aux fonctions devant les manipuler. 

~~~cpp
#include <iostream>
#include <vector>
#include <array>

using namespace std;

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
      swap(t[i], t[i_min]);
   }
}

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
   
   array  a     {"chien"s, "chat"s, "souris"s, "poisson"s};
   n = a.size();
   afficher(a, n); tri(a, n); afficher(a, n);
   
   double t[] = {6.1, 2.2, 8.3, 7.4, 1.5, 3.6};
   n = sizeof t / sizeof(double);
   afficher(t, n); tri(t, n); afficher(t, n);
}
~~~

</details>


