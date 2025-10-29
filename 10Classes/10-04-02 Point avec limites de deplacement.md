# Point avec des limites de déplacement

Reprendre la classe Point de l'exercice [10-04-01](10-04-01%20Point%20avec%20constructeurs.md) et faites les modifications / ajouts nécessaires afin d'y intégrer les fonctionnalités suivantes :

- Chaque point a des coordonnées comprises entre 0 et xMax pour x, et entre 0 et yMax pour y
- Ces limites ne peuvent pas être modifiées après la création d'un point et peuvent être différentes d'un point à l'autre. Par defaut, xMax = yMax = 100
- Ces limites sont mises en oeuvre de manière stricte par la classe. Tout appel à une méthode qui entrainerait un non respect des contraintes a un effet nul

Le code ci-dessous doit s'exécuter correctement et afficher le résultat ci-après.

~~~cpp
#include <iostream>

using namespace std;

int main() {
   Point p1(1.2, 2.4);
   cout << "p1"; p1.afficher();
   p1.deplacer(1., 3.);
   cout << "p1"; p1.afficher();
   p1.setX(4.);
   cout << "p1"; p1.afficher();
   p1.setY(7.);
   cout << "p1"; p1.afficher();

   Point p2(3., 4.2, 10., 10.);
   cout << "p2"; p2.afficher();
   p2.deplacer(15, 2);
   cout << "p2"; p2.afficher();
   p2.deplacer(3, 2);
   cout << "p2"; p2.afficher();
   p2.setX(-3);
   cout << "p2"; p2.afficher();
   p2.setY(12);
   cout << "p2"; p2.afficher();
}
~~~

~~~text
p1(1.2,2.4), contraintes: [0,100]x[0,100]
p1(2.2,5.4), contraintes: [0,100]x[0,100]
p1(4,5.4), contraintes: [0,100]x[0,100]
p1(4,7), contraintes: [0,100]x[0,100]
p2(3,4.2), contraintes: [0,10]x[0,10]
p2(3,4.2), contraintes: [0,10]x[0,10]
p2(6,6.2), contraintes: [0,10]x[0,10]
p2(6,6.2), contraintes: [0,10]x[0,10]
p2(6,6.2), contraintes: [0,10]x[0,10]
~~~

<details>
<summary>Solution</summary>

~~~cpp
#include <iostream>

using namespace std;

class Point {
   double x, y;
   double maxX, maxY;  // pas besoin de const. L'absence de modificateurs suffit

   bool x_valide(double x) const;
   bool y_valide(double y) const;
   
public:
   // constructeurs
   Point();
   Point(double abscisse, double ordonnee, double maxX = 100., double maxY = 100.);

   // fonctions membres
   void deplacer(double dx, double dy);
   void afficher() const;

   // modificateurs
   void setX(double abscisse);
   void setY(double ordonnee);
};

// -----------------------------------------------------------------

int main() {
   Point p1(1.2, 2.4);
   cout << "p1"; p1.afficher();
   p1.deplacer(1., 3.);
   cout << "p1"; p1.afficher();
   p1.setX(4.);
   cout << "p1"; p1.afficher();
   p1.setY(7.);
   cout << "p1"; p1.afficher();

   Point p2(3., 4.2, 10., 10.);
   cout << "p2"; p2.afficher();
   p2.deplacer(15, 2);
   cout << "p2"; p2.afficher();
   p2.deplacer(3, 2);
   cout << "p2"; p2.afficher();
   p2.setX(-3);
   cout << "p2"; p2.afficher();
   p2.setY(12);
   cout << "p2"; p2.afficher();
}

// -----------------------------------------------------------------
Point::Point() : Point(0., 0.) {}

Point::Point(double abscisse, double ordonnee, double max_abs, double max_ord) : 
             x(abscisse), y(ordonnee), 
             maxX(max(abscisse, max_abs)), maxY(max(ordonnee, max_ord)) {}

bool Point::x_valide(double abscisse) const {
   return abscisse >= 0 and abscisse <= maxX;
}

bool Point::y_valide(double ordonnee) const {
   return ordonnee >= 0 and ordonnee <= maxY;
}

void Point::setX(double abscisse){
   if (x_valide(abscisse))
      x = abscisse;
}

void Point::setY(double ordonnee){
   if (y_valide(ordonnee))
      y = ordonnee;
}

void Point::deplacer(double dx, double dy) {
   if (x_valide(x + dx) and y_valide(y + dy)) {
      x += dx;
      y += dy;
   }
}

void Point::afficher() const {
   cout << "(" << x << "," << y << ")" << ", contraintes: [0," << maxX << "]x[0," << maxY << "]\n";
}
// -----------------------------------------------------------------
~~~

</details>
