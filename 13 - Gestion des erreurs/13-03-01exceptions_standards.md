# try/catch

Indiquer ce que va afficher le programme suivant :

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


~~~cpp
#include<iostream>
using namespace std;
void f() {
   throw std::out_of_range("oops");
}

int main() {
   try {
      try {
         f();
      } catch (runtime_error& e) {
         cout << "R : " << e.what() << endl;
         throw;
      } catch (exception e) {
         cout << "E1 : " << e.what() << endl;
         throw;
      }
   } catch (logic_error& e) {
      cout << "L : " << e.what() << endl;
   } catch (exception& e) {
      cout << "E2 : " << e.what() << endl;
   }
   
   cout << "Fin du programme" << endl;
}
~~~

Consultez la documentation de [`std::out_of_range`](https://en.cppreference.com/w/cpp/error/out_of_range)

<details>
<summary>Solution</summary>
E1 : std::exception<br>
L : oops<br>
Fin du programme<br>
</details>
