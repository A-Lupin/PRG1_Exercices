# Recherche dichotomique

Écrire une fonction _recherche_ récursive qui exploite 
le fait que le tableau dans lequel on cherche est trié
par ordre croissant. On compare alors la valeur 
cherchée à celle au milieu du tableau, ce qui permet 
de ne chercher que dans une moitié du tableau à l'étape 
suivante. 

Le programme suivant 

~~~cpp
int main() {
   for (vector<int> const& v:
           {vector<int>{1, 2, 3, 5, 7, 11, 13, 17},
            {1, 3, 5, 7, 9, 11, 13, 15, 17},
            {2, 4, 6, 8, 10, 12, 14, 16, 18},
            {5, 10, 15, 20},
            {11},
            {1},
            {}
           }) {
      for (int e: {3, 11, 15}) {
         cout << to_string(v)
              << (recherche(v, e) ? " contient " : " ne contient pas ")
              << e << endl;
      }
   }
}
~~~

Doit afficher 

~~~
[1, 2, 3, 5, 7, 11, 13, 17] contient 3
[1, 2, 3, 5, 7, 11, 13, 17] contient 11
[1, 2, 3, 5, 7, 11, 13, 17] ne contient pas 15
[1, 3, 5, 7, 9, 11, 13, 15, 17] contient 3
[1, 3, 5, 7, 9, 11, 13, 15, 17] contient 11
[1, 3, 5, 7, 9, 11, 13, 15, 17] contient 15
[2, 4, 6, 8, 10, 12, 14, 16, 18] ne contient pas 3
[2, 4, 6, 8, 10, 12, 14, 16, 18] ne contient pas 11
[2, 4, 6, 8, 10, 12, 14, 16, 18] ne contient pas 15
[5, 10, 15, 20] ne contient pas 3
[5, 10, 15, 20] ne contient pas 11
[5, 10, 15, 20] contient 15
[11] ne contient pas 3
[11] contient 11
[11] ne contient pas 15
[1] ne contient pas 3
[1] ne contient pas 11
[1] ne contient pas 15
[] ne contient pas 3
[] ne contient pas 11
[] ne contient pas 15
~~~


<details>
<summary>Solution</summary>

~~~cpp
bool rechercheDichotomique(const std::vector<int>& vec, int e, size_t debut, size_t fin) {
    // Si la plage est invalide
    if (debut >= fin) {
        return false;
    }

    // On calcule l'indice du milieu
    size_t milieu = debut + (fin - debut) / 2;

    // Comparer la valeur à l'indice du milieu
    if (vec[milieu] == e) {
        return true;  // La valeur a été trouvée
    }

    // Si la valeur est plus petite que celle du milieu, on cherche dans la partie gauche
    if (vec[milieu] > e) {
        return rechercheDichotomique(vec, e, debut, milieu);
    } else {
        // Sinon, on cherche dans la partie droite
        return rechercheDichotomique(vec, e, milieu + 1, fin);
    }
}

bool recherche(const std::vector<int>& vec, int e) {
  return rechercheDichotomique(vec, e, 0, vec.size());
}

~~~
</details>

