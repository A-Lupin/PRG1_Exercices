# Point avec constructeurs

Modifier la classe Point de l'exercice [10-02-02](10-02-02%20Point.md) 
pour pouvoir donner une valeur initiale aux points

Compléter le code suivant afin qu'il s'exécute correctement et affiche le résultat ci-après.

~~~cpp
#include <iostream>

using namespace std;

int main() {
    Point centre;
    centre.afficher();

    Point p(1.2,2.4);
    p.afficher();
    
    p.deplacer(0.8, 0.6);
    p.afficher();

    p.setX(5.5);
    p.setY(10.3);
    cout << p.getX() << " -- " << p.getY() << endl;
}
~~~

~~~text
(0,0)
(1.2,2.4)
(2,3)
5.5 -- 10.3
~~~


<details>
<summary>Solution</summary>

~~~cpp
#include <iostream>

using namespace std;

class Point {
    double x, y;
  public:
    Point();
    Point(double abscisse, double ordonnee);
    
    void setX(double abscisse);
    void setY(double ordonnee);
    
    double getX() const;
    double getY() const;
    
    void deplacer(double dx, double dy);
    void afficher() const;
};

Point::Point() : Point(0.,0.) { }

Point::Point(double abscisse, double ordonnee) : x(abscisse), y(ordonnee) { }

void Point::setX(double abscisse){
    x = abscisse;
}

void Point::setY(double ordonnee){
    y = ordonnee;
}

double Point::getX() const {
    return x;
}

double Point::getY() const {
    return y;
}

void Point::deplacer(double dx, double dy) {
    x += dx;
    y += dy;
}

void Point::afficher() const {
    cout << "(" << x << "," << y << ")" << endl;
}

int main() {
    Point centre;
    centre.afficher();

    Point p(1.2,2.4);
    p.afficher();
    
    p.deplacer(0.8, 0.6);
    p.afficher();

    p.setX(5.5);
    p.setY(10.3);
    cout << p.getX() << " -- " << p.getY() << endl;
}
~~~



</details>
