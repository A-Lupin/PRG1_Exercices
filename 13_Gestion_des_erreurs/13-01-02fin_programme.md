# Terminaison de programme (1)

Que va afficher le programme ci-dessous, lorsque l'utilisateur saisit un chiffre entre 0 et 9 ?

~~~cpp
#include <iostream>
#include <exception>
using namespace std;

int n;    // Variable globale, statique

class A { // Pour mettre en évidence la destruction de variables
  double x;
public:
  A(double valeur): x(valeur){}
  ~A(){cout << "Destructeur " << "x = " << x << endl;}
};

void a() { cout << "a ";         exit(0);}  // sortie "propre", sans échec
void b() { A z(n); cout << "b "; exit(-1);} // sortie "propre", avec échec
void c() { cout << "c ";         abort();}  // sortie abrupte

void d() { cout << "d\n";}                  // Pour illuster atexit()
void e() { cout << "e ";}                   // idem

void f() { cout << "f\n";  terminate();}    // par défaut, appelle juste abort()
void g() { cout << "g " << flush;}          // vider explicitement le tampon
void h() { A z(n); cout << "h "; exit(3);}  // exit ne détruit pas z
void i() {static A y(-8.3); }               // exit détruit la var. globale y

void j() { cout << "j " << (n/0) << endl;}  // instruction illégale

int main()
{
  atexit(d);    // empile la fonction d(), exécutée s'il y a un appel à exit()
  
  i();          // réserve de la place pour y, détruite par exit()
  
  cin >> n;
  
  A objet(n + 0.5); // Variable locale à main()
  
  if (n == 0)
    return 0;   
               
  atexit(e);    // empile e() par dessus d()
  
  switch (n) {
    case 1 : return 1; 
    case 2 : a();
    case 3 : b();
    case 4 : c();
    case 5 : f();
  }
  
  set_terminate(g); // terminate() appelle g(), puis abort() au retour de g

  if (n == 6)
    f();
            
  set_terminate(h); // terminate() appellera h() qui termine "proprement"

  switch (n) { 
    case 7 : f(); 
    case 8 : exit(2);    
    default : j();
 }
}
~~~

<details>
<summary>la valeur 0</summary>

~~~text
  // Fin normale: appeler terminate() s'il y a des exceptions non traitées;
  // Détruire les objets locaux, appeler exit(0), donc les fonctions empilées
  // par atexit(), ce qui provoque la fermeture des fichiers et connexions,
  // libère la mémoire, détruit les objets globaux (static) et vide les 
  // tampons, ce qui entraîne l'affichage de:

Destructeur x = 0.5
Destructeur x = -8.3
d

  // Finalement: envoyer le code de retour 0
  // Ces actions sont faites par return 0; ajouté par le compilateur si non
  // présent à la fin de main()
~~~

</details>

<details>
<summary>la valeur 1</summary>

~~~text
Destructeur x = 1.5
e Destructeur x = -8.3
d
                // échec; code de retour: 256 (linux; 1 avec g++ sous Windows)
                // tampons vidés, fichiers et connexions fermés, 
                // objets détruits
~~~

</details>

<details>
<summary>la valeur 2</summary>

~~~text
a e Destructeur x = -8.3
d
~~~

</details>

<details>
<summary>la valeur 3</summary>

~~~text
b e Destructeur x = -8.3
d
                // code de retour: 65280 (-1 Windows)
                // objets pas détruits
~~~

</details>

<details>
<summary>la valeur 4</summary>

~~~text
Abandon (core dumped)  
                // code de retour: 34304 (3 Windows)
                // Fin abrupte, tampons pas toujours vidés ("c" absent), etc.
~~~

</details>

<details>
<summary>la valeur 5</summary>

~~~text
f
terminate called without an active exception
Abandon (core dumped) //message absent sous Windows
                // code de retour: 34304

~~~

</details>

<details>
<summary>la valeur 6</summary>

~~~text
f
g Abandon (core dumped)
                // code de retour: 34304
~~~

</details>

<details>
<summary>la valeur 7</summary>

~~~text
f
h e Destructeur x = -8.3
d
                // code de retour: 768 (3 sous Windows)
~~~

</details>

<details>
<summary>la valeur 8</summary>

~~~text
e Destructeur x = -8.3
d
                // code de retour: 512 (2 sous Windows)
~~~

</details>

<details>
<summary>la valeur 9</summary>

~~~text
Instruction non permise (core dumped)
                // code de retour: 33792 (-1073741795 sous Windows)
~~~

</details>


