# Accroissement d'un avoir bancaire (3)

Modifier le code de l'exercice "Accroissement d'un avoir bancaire (2)" pour qu'il vérifie que
- le montant initial est >= 1000
- le taux d'intérêt (en pourcents) est entre -5 et +50 (compris)
- le nombre d'années est > 0

Reposer exactement la même question tant que l'utilisateur ne répond pas avec un nombre valide. Utiliser des boucles `do ... while`

~~~
Entrer le montant initial > 500
Entrer le montant initial > -2000
Entrer le montant initial > 1000
Entrer le taux d'interet annuel en % > 5
Entrer le nombre d'années > 10
Le montant disponible après 10 ans est de 1628.89 CHF
~~~

~~~
Entrer le montant initial > 10000
Entrer le taux d'interet annuel en % > 11
Entrer le nombre d'années > 0
Entrer le nombre d'années > -2
Entrer le nombre d'années > 4
Le montant disponible après 4 ans est de 15180.7 CHF
~~~

~~~
Entrer le montant initial > 100000
Entrer le taux d'interet annuel en % > 60
Entrer le taux d'interet annuel en % > -10
Entrer le taux d'interet annuel en % > 2
Entrer le nombre d'années > 10
Le montant disponible après 10 ans est de 121899 CHF
~~~


<details>
<summary>Solution</summary>

~~~cpp
#include <iostream>
using namespace std;

const double montant_minimum = 1000.;
const double taux_min = -5.; 
const double taux_max = +50.;
const int nb_annees_min = 1;

int main() {

   double montant_initial; // en CHF
   do {
      cout << "Entrer le montant initial > ";
      cin >> montant_initial;
   } while (montant_initial < montant_minimum);

   double taux_interet_annuel; // en %
   do {
      cout << "Entrer le taux d'interet annuel en % > ";
      cin >> taux_interet_annuel;
   } while (taux_interet_annuel > taux_max or taux_interet_annuel < taux_min );

   int nb_annees;
   do {
      cout << "Entrer le nombre d'années > ";
      cin >> nb_annees;
   } while (nb_annees < nb_annees_min);

   double montant = montant_initial;
   for (int i = 0; i < nb_annees; ++i) {
      montant *= (1. + taux_interet_annuel / 100.);
   }

   cout << "Le montant disponible après "
        << nb_annees << " an" << (nb_annees > 1 ? "s" : "")
        << " est de " << montant << " CHF" << endl;
}
~~~
</details>

