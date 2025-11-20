# Classe générique Coord - spécialisation

Écrire une classe `Coord` qui stocke des coordonnées sous la forme d'un tableau natif et qui permet d'obtenir le résultat indiqué pour les instructions suivantes. Lorsque la dimension est 2, il faut pouvoir récupérer les coordonnées polaires.

~~~cpp
int main() {
  Coord<int,2> c;
  c[1] = 3;
  c.afficher(); // Affiche 0 3
  cout << c.phi() << endl; // Affiche 1.5708
  Coord<int, 4> d;
//  cout << d.phi() << endl; pas possible
  cout << d[3] << endl; // Affiche 0
}
~~~

<details>
<summary>Solution 1</summary>
Spécialisation de la classe entière
~~~cpp
using namespace std;
template<typename T, size_t n>
class Coord{  
  T coord[n];
 public:
  Coord(): coord() {} 
  size_t size() const {return n;}
  T & operator[](size_t i){ return coord[i];};
  T operator[](size_t i) const { return coord[i];} 
  bool operator==(const Coord &) const = default;
  void afficher() const { for(const T & e : coord) cout << e << ' '; cout << endl;};
};

// Spécialisation pour n = 2; on doit tout récrire  
template<typename T>
class Coord<T, 2> {  
  T coord[2];
 public:
  Coord(): coord() {} 
  size_t size() const {return 2;}
  T & operator[](size_t i){ return coord[i];};
  T operator[](size_t i) const { return coord[i];} 
  bool operator==(const Coord &) const = default;
  void afficher() const { for(const T & e : coord) cout << e << ' '; cout << endl;};
  double rho() const {return hypot(coord[0],coord[1]);}
  double phi() const {return atan2(coord[1],coord[0]);}
};
~~~

</details><details>
<summary>Solution 2</summary>
Vérification à la compilation que rho et phi ne peuvent être appelés qu'en dimension 2
~~~cpp
using namespace std;
template<typename T, size_t n>
class Coord{  
  T coord[n];
 public:
  Coord(): coord() {} 
  size_t size() const {return n;}
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
