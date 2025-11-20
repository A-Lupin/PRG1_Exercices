# Classe générique Coord - concept

Une autre manière d'exploiter la bibliothèque `type_traits` est de remplacer dans la déclaration de classes générique le mot-clé `typename` par un concept, que l'on peut librement nommer, et qui impose au type générique de remplir certaines caractéristiques.

~~~cpp
template <typename T>
concept Arithmetique = std::is_arithmetic<T>::value;
}
~~~

Adapter la classe `Coord` à l'aide du concept `Arithmetique` de sorte que l'on ne puisse plus la compiler avec des types qui ne sont pas des types entiers ou flottants. 

~~~

<details>
<summary>Solution</summary>

~~~cpp
template <typename T>
concept Arithmetic = std::is_arithmetic<T>::value;

using namespace std;
template<Arithmetic T, size_t n> class Coord;

template<Arithmetic T, size_t n> // typename aurait aussi fonctionné ici
std::ostream & operator << (std::ostream& os, const Coord<T, n>& rhs) {
  os << '(';
  for (size_t i = 0; i < rhs.dimension(); ++i) 
    os << (i > 0? ", ": "") << rhs[i];
  os << ')';
  return os;
}

template<Arithmetic T = int, size_t n = 2>
class Coord{  
... le reste est identique
~~~

</details>
