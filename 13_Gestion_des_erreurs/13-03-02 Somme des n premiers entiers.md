# Somme des n premiers entiers naturels 

Compléter le programme C++ ci-dessous qui met à disposition une fonction `somme_n_premiers_entiers` permettant de sommer les n premiers entiers ≥ 0 et dont le prototype est

~~~cpp
int sommeNPremiersEntiers(int n);
~~~

Faire en sorte d'implémenter `somme_n_premiers_entiers` en tenant compte de toutes les situations problématiques potentielles.

_NB_ L'exercice doit être résolu en utilisant exclusivement une(des) exception(s) prédéfinie(s).

~~~cpp
#include <iostream>
#include <limits>
#include <stdexcept>
using namespace std;

int somme_n_premiers_entiers(int n);
void test(int n);

int main() {

   test(-1);
   test(0);
   test(1);
   test(65535);
   test(65536);
}
~~~

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
#include <limits>
#include <stdexcept>
using namespace std;

int somme_n_premiers_entiers(int n);
void test(int n);

int main() {

   test(-1);
   test(0);
   test(1);
   test(65535);
   test(65536);
}

int somme_n_premiers_entiers(int n) {
   if (n < 0)
      throw invalid_argument("Argument non valide: n doit etre >= 0");      
   if (n / 2 > numeric_limits<int>::max() / (n+1))
      throw overflow_error("Un debordement est survenu dans les calculs");
   if (n % 2 == 0) return n / 2 * (n+1);
   else return (n+1)/2 * n;
}

void test(int n) {
   cout << "somme_n_premiers_entiers(" << n << ")";
   try {
      cout << " = " << somme_n_premiers_entiers(n) << endl;
   } catch (const exception& e) {
      cout << ": " << e.what() << endl;
   }
}

// somme_n_premiers_entiers(-1) = : Argument non valide: n doit etre >= 0
// somme_n_premiers_entiers(0) = 0
// somme_n_premiers_entiers(1) = 1
// somme_n_premiers_entiers(65535) = 2147450880
// somme_n_premiers_entiers(65536) = : Un debordement est survenu dans les calculs
~~~



</details>
