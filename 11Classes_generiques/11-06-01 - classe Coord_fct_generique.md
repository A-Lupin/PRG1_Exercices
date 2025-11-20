# Classe générique Coord - Fonctions générique

Écrire une classe `Coord` qui stocke des coordonnées sous la forme d'un tableau natif et qui permet d'obtenir le résultat indiqué pour les instructions suivantes. Il faut prévoir un constructeur permettant de passer d'un type de `Coord` vers un autre type (à la fois en ce qui concerne le type des éléments et la dimension)

~~~cpp
int main() {
  Coord<double,2> c;
  c[1] = 3;
  c.afficher(); // Affiche 0 3
  Coord<int, 55> d;
  d[2] = 5;
  cout << d[2] << endl; // Affiche 5
  Coord<double, 4> b(d); 
  b[3] = 4.4;
  b.afficher(); // Affiche 0 0 5 4.4
}

~~~

<details>
<summary>Solution</summary>

~~~cpp
using namespace std;
template<typename T = int, size_t n = 2>
class Coord{  
  T coord[n];
 public:
  Coord(): coord({}) {}
  template<typename U, size_t m>
  Coord(const Coord<U, m> &c) : coord({}) {
    for (size_t i = 0; i < min(n, m); ++i) coord[i] = T(c[i]);
  }
  constexpr size_t size() const {return n;}
  T & operator[](size_t i){ return coord[i];};
  T operator[](size_t i) const { return coord[i];}
  bool operator==(const Coord &) const = default;
  void afficher() const { for(const T & e : coord) cout << e << ' '; cout << endl;};
  
  // Méthodes spécifiques à la dimension 2
  double rho() const {
    static_assert(n == 2, "rho définie seulement en dimension 2");
    return hypot(coord[0], coord[1]);
  }
  
  double phi() const {
    static_assert(n == 2, "phi définie seulement en dimension 2");
    return atan2(coord[1], coord[0]);
  }
};
~~~

</details>
