# Classe générique Coord - Paramètres par défaut

Écrire une classe `Coord` qui stocke des coordonnées sous la forme d'un tableau natif et qui permet d'obtenir le résultat indiqué pour les instructions suivantes. Sans précision du type et de la dimension, le type est `int` et la dimension 2.

~~~cpp
int main() {
  Coord<int,2> c;
  c[1] = 3;
  c.afficher(); // Affiche 0 3
  cout << c.phi() << endl; // Affiche 1.5708
  Coord<int, 4> d;
  cout << d[3] << endl; // Affiche 0
  Coord a;
  a[0] = 3; a[1] = 4;
  cout << a.rho() << endl; // Affiche 5
}
~~~

<details>
<summary>Solution</summary>

~~~cpp
// Il suffit de modifier la définition de l'en-tête de généricité de Coord: 
template<typename T = int, size_t n = 2>
...
};
~~~

</details>
