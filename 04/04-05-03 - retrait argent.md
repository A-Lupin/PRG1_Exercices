# Retrait d'argent
Écrire un programme C++ mettant à disposition une fonction permettant de retirer un certain montant sur un compte bancaire.

La fonction :

- doit prendre 2 paramètres : le solde courant du compte et le montant du retrait (que l'on
supposera tous deux ≥ 0)
- doit vérifier les contraintes suivantes :
  - le solde courant ne peut jamais être négatif
  - si le solde courant est insuffisant pour retirer l'intégralité du montant souhaité, seul
  le montant maximal possible est retiré
- doit retourner le montant du retrait effectif réalisé

Vérifier le bon fonctionnement de la fonction en appliquant le scénario de test suivant :

- Solde initial du compte = 500
- Premier retrait = 300
- Afficher le montant du retrait effectif et le solde courant du compte
- Deuxième retrait = 300
- Afficher le montant du retrait effectif et le solde courant du compte

<details>
<summary>Solution</summary>

~~~cpp
#include <iomanip>
#include <iostream>

using namespace std;

double retrait(double  montant_retrait,
               double& solde_courant);
               
void afficher(const string& texte,
              double valeur,
              int precision);

//------------------------------------------------------------
int main() {
   double solde_courant = 500,
          retrait_effectif;
   retrait_effectif = retrait(300, solde_courant);
   afficher("Montant retrait effectif = ", retrait_effectif, 1);
   afficher("Solde courant            = ", solde_courant,    1);
   
   retrait_effectif = retrait(300, solde_courant);
   afficher("Montant retrait effectif = ", retrait_effectif, 1);
   
   afficher("Solde courant            = ", solde_courant,    1);
}

//------------------------------------------------------------
double retrait(double  montant_retrait,
               double& solde_courant) {
   montant_retrait = solde_courant > montant_retrait ? 
                     montant_retrait : solde_courant;
   solde_courant -=  montant_retrait;
   return montant_retrait;
}

//------------------------------------------------------------
void afficher(const string& texte, double valeur, int precision) {
   cout << texte << fixed << setprecision(precision) << valeur << endl;
}

//------------------------------------------------------------
// Montant retrait effectif = 300.0
// Solde courant            = 200.0
// Montant retrait effectif = 200.0
// Solde courant            = 0.0

~~~
</details>
