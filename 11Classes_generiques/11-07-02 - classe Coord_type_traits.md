# Classe générique Coord - type_traits

La bibliothèque `type_traits` met à disposition notamment des structures génériques instanciées pour divers types comportant une constante booléenne nommée `value` qui prend la valeur `true`si le type présente certaines caractéristiques.
Par exemple `std::is_arithmetic<int>::value` est vraie alors que `std::is_arithmetic<std::string>::value` est fausse. 
Adapter la classe `Coord` de sorte que l'on ne puisse plus la compiler avec des types qui ne sont pas des types entiers ou flottants. 

~~~cpp
//   Coord<string, 2> c; // Déclaration rejetée à la compilaton
}
~~~

<details>
<summary>Solution</summary>

~~~cpp
template<typename T = int, size_t n = 2> class Coord { 
    static_assert(std::is_arithmetic<T>::value, "T n'est pas une valeur arithmétique");
... // le reste est identique aux exercices précédents
~~~

</details>
