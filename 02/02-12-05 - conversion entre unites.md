# Conversion de mètres en miles, pieds et pouces

Écrire un programme C++ permettant de réaliser les trois conversions d'unités suivantes :
- mètres en miles
- mètres en pieds (feet en anglais)
- mètres en pouces (inches en anglais).
  
Le nombre de mètres est saisi par l'utilisateur sous la forme d'un entier > 0. On suppose ladite saisie correcte.
On rappelle qu'un pouce fait 2.54 cm, qu'un pied fait 12 pouces et qu'un mile fait 5280 pieds.

Un exemple d'exécution :
~~~
Entrer le nombre de mètres à convertir (entier > 0) : 1000
1000 [m]
= 0.621371 [mile]
= 3280.84 [ft]
= 39370.1 [inch]
~~~



<details>
<summary>Solution</summary>

~~~cpp
#include <iostream>
using namespace std;

int main() {

    const double inch_en_m = 0.0254;
    const int ft_en_inch = 12;
    const int mile_en_ft = 5280;

    // Saisie utilisateur
    int nb_metres;
    cout << "Entrer le nombre de mètres à convertir convertir (entier > 0) : ";
    cin >> nb_metres;
    
    double nb_inch = nb_metres / inch_en_m, nb_ft = nb_inch / ft_en_inch,
           nb_mile = nb_ft / mile_en_ft;

    cout << nb_metres << " [m]" << endl
         << "= " << nb_mile << " [mile]" << endl
         << "= " << nb_ft    << " [ft]"   << endl
         << "= " << nb_inch  << " [inch]" << endl;
}
~~~
   
   



</details>
