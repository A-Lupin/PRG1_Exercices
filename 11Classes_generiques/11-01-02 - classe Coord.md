# Classe générique Coord 

Écrire une classe `Coord` qui stocke des coordonnées sur le plan sous la forme d'un tableau natif et qui permet d'obtenir le résultat indiqué pour les instructions suivantes.

~~~cpp
int main() {
  Coord<int> c;
  c.afficher(); // Affiche 0 0 
  c[1] = 3;
  c.afficher(); // Affiche 0 3 
  Coord<double> d;
  d[0] = 3.3; d[1] = 5.5;
  d.afficher(); // Affiche 3.3 5.5
  const auto a(c);
  cout << a.size() << ' ' << a[1] << ' ' << (a == c) << endl; // Affiche 2 3 1
}
~~~

<details>
<summary>Solution</summary>

~~~cpp
using namespace std;
template<typename T>
class Coord{  
  T coord[2];
 public:
  Coord(): coord() {} // Initialisation à 0 par défaut
  size_t size() const {return 2;}
  T & operator[](size_t i){ return coord[i];};
  T operator[](size_t i) const { return coord[i];} // Nécessaire pour les const Coord
  bool operator==(const Coord &) const = default;
  void afficher() const { for(const T & e : coord) cout << e << ' '; cout << endl;};
};
~~~

</details>
