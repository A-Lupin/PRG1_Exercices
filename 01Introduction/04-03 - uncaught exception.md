# Uncaught Exception

Déterminer pour quelle valeur de i le programme plante.

~~~cpp
#include <iostream>
#include <array>

using namespace std;

int main() {
   std::array a { 1, 2, 3};
   for(int i = 0; i < 10; ++i)
      a.at(i) = i;
   cout << "hello" << endl;
}
~~~

<details>
<summary>Solution</summary>
Le programme s'arrête quand i vaut 3
</details>
