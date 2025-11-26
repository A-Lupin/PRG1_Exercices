# Afficher matrice

Soient les déclarations génériques.

~~~cpp
template <typename T>
using Ligne   = vector<T>;

template <typename T>
using Matrice = vector<Ligne<T>>;

Matrice<int> m {{0},
                {1, 2},
                {3, 4, 5},
                {6, 7, 8, 9}};

cout << m;
~~~

Écrire le code nécessaire afin que le code produise ceci.

~~~
[[0], [1, 2], [3, 4, 5], [6, 7, 8, 9]]
~~~

<details>
<summary>Solution</summary>

Il n'y a qu'un opérateur générique à définir, qui sera instancié deux fois, pour:
`T = int` et `T = vector<int>`
~~~cpp
template <typename T>
ostream& operator<< (ostream& os, const vector<T>& v) {
   os << "[";
   for (size_t i = 0; i < v.size(); ++i) {
      if (i) os << ", ";
      os << v[i];
   }
   os << "]";
   return os;
}
~~~

-----------------------------------------------------

</details>

Même question mais cette fois au format.

~~~
[[0]
 [1, 2]
 [3, 4, 5]
 [6, 7, 8, 9]]
~~~

<details>
<summary>Solution</summary>

Il faut ajouter une surcharge spécifique pour les `vector<vector<T>>`
~~~cpp
template <typename T>
ostream& operator<< (ostream& os, const vector<T>& v) {
   os << "[";
   for (size_t i = 0; i < v.size(); ++i) {
      if (i) os << ", ";
      os << v[i];
   }
   os << "]";
   return os;
}

template <typename T>
ostream& operator<< (ostream& os, const vector<vector<T>>& m) {
   os << "[";
   for (size_t i = 0; i < m.size(); ++i) {
      if (i) os << endl << " ";
      os << m[i];
   }
   os << "]";
   return os;
}
~~~

</details>
