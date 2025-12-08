# Supprimer un élément d'une position donnée dans un vector

Écrire une fonction C++ pour supprimer un élément d'une position donnée dans un tableau std::vector<int>. La fonction doit lever une(des) exception(s) en cas de problème(s) empêchant la suppression.

~~~cpp
void remove_from_vector(std::vector<int>& vec, size_t pos);
~~~

_NB_ L'exercice doit être résolu en utilisant exclusivement une(des) exception(s) prédéfinie(s).

**Rappel** Hiérarchie des exceptions

~~~mermaid
graph TD
  exception(Exception)
  
  bad_alloc(Bad Alloc)
  logic_error(Logic Error)
  invalid_argument(Invalid Argument)
  out_of_range(Out of Range)

  runtime_error(Runtime Error)
  overflow_error(Overflow Error)
  range_error(Range Error)

  exception     --> bad_alloc
  exception     --> logic_error
  logic_error   --> invalid_argument
  logic_error   --> out_of_range
  exception     --> runtime_error
  runtime_error --> overflow_error
  runtime_error --> range_error
~~~

<details>
<summary>Solution</summary>

~~~cpp
#include <iostream>
#include <vector>
#include <stdexcept>

void remove_from_vector(std::vector<int>& vec, size_t pos) {
    if (pos >= vec.size()) {
        throw std::out_of_range("Position hors limites du vecteur");
    }

    vec.erase(vec.begin() + pos);
}

int main() {
    size_t taille, pos;
    std::cin >> taille >> pos;
    
    std::vector<int> v(taille);
    for (int i = 0; i < taille; ++i) v[i] = i;
    
    try {
        remove_from_vector(v, pos);

        // Affichage du vecteur après suppression
        for (int val : v) {
            std::cout << val << " ";
        }
        std::cout << std::endl;
    } catch (const std::exception& e) {
        std::cerr << "Erreur: " << e.what() << std::endl;
    }
}
~~~

</details>
