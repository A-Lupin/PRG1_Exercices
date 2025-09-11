# Permutation circulaire droite de 3 réels

Reprendre l'exercice [04-05-02 - permutation](../04%20-%20Fonctions/04-05-02%20-%20permutation.md) mais sans utiliser de référence `double& ref`

<details>
<summary>Solution</summary>

~~~cpp
#include <iostream>

using namespace std;

void permutationCirculaireDroite(double* x,
                                 double* y,
                                 double* z);

void afficher(double x,
              double y,
              double z);

//------------------------------------------------------------
int main() {
   double x = 1, y = 2, z = 3;
   for (int i = 1; i <= 3; ++i) {
      permutationCirculaireDroite(&x, &y, &z);
      afficher(x, y, z);
   }
}

//------------------------------------------------------------
void permutationCirculaireDroite(double* x,
                                 double* y,
                                 double* z) {
   double tmp = *z;
   *z = *y;
   *y = *x;
   *x = tmp;
}

//------------------------------------------------------------
void afficher(double x, double y, double z) {
   cout << "x = " << x << "
            y = " << y << "
            z = " << z << endl;
}
~~~
</details>
