# Classe générique Coord - Fonctions générique

Écrire une classe `Coord` qui stocke des coordonnées sous la forme d'un tableau natif et qui permet d'obtenir le résultat indiqué pour les instructions suivantes. Il faut prévoir un constructeur permettant de passer d'un type de `Coord` vers un autre type (à la fois en ce qui concerne le type des éléments et la dimension)

~~~cpp
#include <iostream>        
int main() {
  Coord<double,2> c;
  c[1] = 3.3;
  std::cout << c.phi() << ' ' << c << std::endl; // Affiche 1.5708 (0, 3.3)
  Coord<int, 66> d;
  d[3] = 5.5;
  std::cout << d[3] << ' ' << d.size() << std::endl; // Affiche 5 66
  Coord a(c);
  std::cout << a.phi() << ' ' << a << std::endl; // Affiche 1.5708 (0, 3.3)
  Coord<double, 4> b(d);
  b[1] = 1.1;
  std::cout <<  b.size() << ' ' << b << std::endl; // Affiche 4 (0, 1.1, 0, 5)
}
~~~

<details>
<summary>Solution</summary>

~~~cpp
#include <cstdlib> // size_t
#include <ostream>
#include <cmath>

/* Si on a besoin d'accéder à des données privées de Coord<T, n>, prévoir ceci:
template<typename T, size_t n> class Coord;
template<typename T, size_t n> 
std::ostream & operator << (std::ostream& os, const Coord<T, n>& rhs) {
  os << '(';
  for (size_t i = 0; i < rhs.size(); ++i) 
    os << (i > 0? ", ": "") << rhs.data[i]; // si on tient absolument à imposer friend
  os << ')';
  return os;
}
*/

template<typename T = int, size_t n = 2>
class Coord{  
  T coord[n];
 public:
  Coord(): coord({}) {}
  template<typename U, size_t m>
  Coord(const Coord<U, m> &c) : coord({}) {
    for (size_t i = 0; i < std::min(n, m); ++i) coord[i] = T(c[i]);
  }
  constexpr size_t size() const {return n;}
  T & operator[](size_t i){ return coord[i];};
  T operator[](size_t i) const { return coord[i];}
  bool operator==(const Coord &) const = default;

  // Méthodes spécifiques à la dimension 2
  double rho() const {
    static_assert(n == 2, "rho définie seulement en dimension 2");
    return hypot(coord[0], coord[1]);
  }
  
  double phi() const {
    static_assert(n == 2, "phi définie seulement en dimension 2");
    return atan2(coord[1], coord[0]);
  }

//  friend std::ostream& operator<< <T>(std::ostream& os, const Coord<T, n>& rhs);
};

// Version qui n'accède à aucune donnée privée de Coord<T, n>
template<typename T, size_t n> 
std::ostream & operator << (std::ostream& os, const Coord<T, n>& rhs) {
  os << '(';
  for (size_t i = 0; i < rhs.size(); ++i) 
    os << (i > 0? ", ": "") << rhs[i];
  os << ')';
  return os;
}

~~~

</details>
