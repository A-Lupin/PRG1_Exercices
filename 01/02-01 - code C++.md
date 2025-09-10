# 1er code C++

Dans le code ci-dessous, à quoi servent les différentes parties numérotées
~~~cpp
#include <iostream>                         // 1
using namespace std;                        // 2

int main()                                  // 3
{                                           // 4
    cout << "Hello world"       << endl;    // 5
    cout << "fin de programme"  << endl;
    return 0;                               // 6
}                                           // 4
~~~

<details>
<summary>Solution</summary>

1. Ajouter une bibliothèque au programme
    - *iostream*  : pour *cout*, *cin*, ...
2. Utilise l'espace de nommage *std*. Sans quoi, il faudrait écrire
    - *std::cout*
    - *std::endl*
3. *main* est le nom de la fonction principale (obligatoire)
    - n'a pas de paramêtre () /!\ *main(void)* serait faux (du C)
    - retourne la valeur 0 si tout s'est bien passé, une valeur autre sinon
4. *{ ... }* bloc de la fonction contenant les instructions
5. Les instructions, toutes se terminent par un ";"
6. Code retourné par la fonction.

   **NB**: Pour la fonction "main" uniquement, le compilateur ajoute cette ligne si elle n'y est pas

</details>
