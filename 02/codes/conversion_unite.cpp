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
