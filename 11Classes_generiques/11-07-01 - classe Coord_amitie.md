# Classe générique Coord - Amitié

Écrire une classe `Coord` qui stocke des coordonnées sous la forme d'un tableau natif et qui permet d'obtenir le résultat indiqué pour les instructions suivantes. Il faut prévoir une surcharge pour l'opérateur `<<`.

~~~cpp
int main() {
  Coord<double,2> c;
  c[1] = 3.3;
  cout << c.phi() << ' ' << c << endl; // Affiche 1.5708 (0, 3.3)
  Coord<int, 66> d;
  d[3] = 5.5;
  cout << d[3] << ' ' << d.size() << endl; // Affiche 5 66
  Coord a(c);
  cout << a.phi() << ' ' << a << endl; // Affiche 1.5708 (0, 3.3)
  Coord<double, 4> b(d);
  b[1] = 1.1;
  cout <<  b.size() << ' ' << b << endl; // Affiche 4 (0, 1.1, 0, 5)
}
~~~

<details>
<summary>Solution</summary>

~~~cpp
template<typename T, size_t n> class Coord;
template<typename T, size_t n> 
std::ostream & operator << (std::ostream& os, const Coord<T, n>& rhs) {
  os << '(';
  for (size_t i = 0; i < rhs.size(); ++i) 
    os << (i > 0? ", ": "") << rhs[i];
  os << ')';
  return os;
}

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

  friend std::ostream& operator<< <T>(std::ostream& os, const Coord<T, n>& rhs);
};
            
~~~

</details>
