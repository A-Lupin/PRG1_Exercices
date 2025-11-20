# Classe générique Coord - paramètre expression

Écrire une classe `Coord` qui stocke des coordonnées dans une dimension définie par le programmeur sous la forme d'un tableau natif et qui permet d'obtenir le résultat indiqué pour les instructions suivantes.

~~~cpp
int main() {
  Coord<int, 3> c;
  c[1] = 3;
  c.afficher(); // Affiche 0 3 0
}
~~~

<details>
<summary>Solution</summary>

~~~cpp
template<typename T, size_t n >
class Coord{  
  T coord[n];
 public:
  Coord(): coord() {} // Initialisation à 0 par défaut
  size_t size() const {return n;}
  T & operator[](size_t i){ return coord[i];};
  T operator[](size_t i) const { return coord[i];} // Nécessaire pour les const Coord
  bool operator==(const Coord &) const = default;
  void afficher() const { for(const T & e : coord) cout << e << ' '; cout << endl;};
};
~~~

</details>
