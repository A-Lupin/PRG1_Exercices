# Fonctions-opérateurs

Une fraction est implémentée par une structure comportant deux entiers représentant numérateur et dénominateur:

~~~cpp

struct Fraction{int num, den;};

~~~

Écrire les fonctions-opérateurs nécessaires pour faire fonctionner correctement le programme principal suivant:

~~~cpp

int main() {
  Fraction a{1,2}, b{2,4}, c{-4,12}, d{-5,-10}, e{3,-9};
  cout << (a == b) << (a < b) << (a <= b) << (c > a) << (c >= e) << (a != d) << endl;
  //imprime 101010
}

~~~

<details>
<summary>Solution</summary>

~~~cpp


#include <iostream>

struct Fraction{int num, den;};

int compare(const Fraction & gauche, const Fraction & droit) {
  return gauche.num * droit.den - droit.num * gauche.den;
}

bool operator==(const Fraction & gauche, const Fraction & droit) {
  return compare(gauche, droit) == 0;
}

bool operator!=(const Fraction & gauche, const Fraction & droit) {
  return not (gauche == droit); // ou compare(gauche, droit) != 0;
}

bool operator<(const Fraction & gauche, const Fraction & droit) {
  return compare(gauche, droit) < 0;
}

bool operator>=(const Fraction & gauche, const Fraction & droit) {
  return not (gauche < droit); 
}

bool operator>(const Fraction & gauche, const Fraction & droit) {
  return droit < gauche;
}
bool operator<=(const Fraction & gauche, const Fraction & droit) {
  return not (gauche > droit); 
}

using namespace std;
int main() {
  Fraction a{1,2}, b{2,4}, c{-4,12}, d{-5,-10}, e{3,-9};
  cout << (a == b) << (a < b) << (a <= b) << (c > a) << (c >= e) << (a != d) << endl;
}

~~~

