# Volume d'une pyramide à base rectangulaire

Écrire un programme C++ mettant à disposition une fonction permettant de calculer le volume d'une pyramide à base rectangulaire.

Appliquer la fonction pour calculer le volume des 2 pyramides suivantes :
1) Pyramide 1 : base de longueur 10 et de largeur 3.5; hauteur = 12
2) Pyramide 2 : base de longueur 3.6 et de largeur 2.4; hauteur = 2.7

<details>
<summary>Solution</summary>

~~~cpp
#include <iostream>
using namespace std;

//------------------------------------------------------------
double volumePyramide(double longueur,
                      double largeur,
                      double hauteur) {
   return longueur * largeur * hauteur / 3.0;
}


//------------------------------------------------------------
int main() {
    cout << "volume pyramide 1 = " << volumePyramide(10, 3.5, 12) << endl;
    cout << "volume pyramide 2 = " << volumePyramide(3.6, 2.4, 2.7) << endl; 
}
~~~
</details>

