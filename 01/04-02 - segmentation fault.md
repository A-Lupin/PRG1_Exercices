# Segmentation Fault

Compilez et exécutez le programme ci-dessous

~~~cpp
#include <iostream>

using namespace std;

int main() {
   int* p = nullptr;
   *p = 42;
   cout << "hello" << endl;
}
~~~

<details>
<summary>Solution</summary>

Le programme devrait compiler, mais crasher à l'exécution en affichant un message similaire à 

~~~
Erreur de segmentation (core dumped)
~~~

 ou
 
~~~
Process finished with exit code -1073741819 (0xC0000005)
~~~

Ce message varie d'un système d'exploitation à l'autre

</details>
