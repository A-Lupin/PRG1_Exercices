# Terminaison de programme (1)

Que va afficher le programme ci-dessous, lorsque l'utilisateur saisit un chiffre entre 9 et 17 ?

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

void d() { cout << "d\n";}                  // Pour illuster atexit()
void e() { cout << "e ";}                   // idem

void g() { cout << "g " << flush;}          // vider explicitement le tampon
void h() { A z(n); cout << "h "; exit(3);}  // exit ne détruit pas z
void i() {static A y(-8.3); }               // exit détruit la var. globale y

void k() { char* c; cout << "k "; throw c;} // Exception de type char*
void l() { cout << "l ";          throw "Une exception de type const char*";}
void m() { cout << "m ";          throw "Une exception de type string"s;}
void p() {throw runtime_error("runtime error dans p");
         } // runtime_error est dérivée de exception

int main()
{
  atexit(d);    // empile la fonction d(), exécutée s'il y a un appel à exit()
  i();          // réserve de la place pour y, détruite par exit() 
  cin >> n; 
  A objet(n + 0.5); // Variable locale à main()              
  atexit(e);    // empile e() par dessus d()
  
  if (n < 10)
    k();     

  set_terminate(g); // terminate() appelle g(), puis abort() au retour de g
  set_terminate(h); // terminate() appellera h() qui termine "proprement"
            
  if (n == 10)
    k();     
       
  try{
    switch (n) {
      case 11: k();      
      case 12: l();
      case 13: m(); 
      case 14:
        try { p(); }               // On peut imbriquer des blocs try-catch
        catch (exception & e) {    // Classe mère de runtime_error
           cout << e.what() << endl; 
           throw 1; 
        } 
      case 15:
        try { p(); }               
        catch (exception e) { // Classe mère de runtime_error, message non transmis
           cout << e.what() << endl; 
           throw 1; 
        } 
      case 16:
        try { p(); }         
        catch (range_error & e) {  // Classe fille de runtime_error
           cout << e.what() << endl; 
           throw 4; 
        } 
      default : throw 6;
    }
  }
  catch(char*)               { cout << "Une exception de type char*" << endl;}
  catch(const char* message) { cout << message << endl;}
  catch(string& message)     { cout << message << endl;}
  catch(...)                 { cout << "Autre exception " << endl;     throw;}
}


<details>
<summary>la valeur 9</summary>

~~~text
terminate called after throwing an instance of 'char*'
Abandon (core dumped)
~~~

</details>

<details>
<summary>la valeur 10</summary>

~~~text
k h e Destructeur x = -8.3
d
                // code de retour: 768 (3 sous Windows)
~~~

</details>

<details>
<summary>la valeur 11</summary>

~~~text
k Une exception de type char*
Destructeur x = 11.5
e Destructeur x = -8.3
d
~~~

</details>

<details>
<summary>la valeur 12</summary>

~~~text
l Une exception de type const char*
Destructeur x = 12.5
e Destructeur x = -8.3
d
~~~

</details>

<details>
<summary>la valeur 13</summary>

~~~text
m Une exception de type string
Destructeur x = 13.5
e Destructeur x = -8.3
d
~~~

</details>

<details>
<summary>la valeur 14</summary>

~~~text
runtime error dans p
Autre exception 
h e Destructeur x = -8.3
d
~~~

</details>

<details>
<summary>la valeur 15</summary>

~~~text
std::exception
Autre exception 
h e Destructeur x = -8.3
d
~~~

</details>

<details>
<summary>la valeur 16</summary>

~~~text
Autre exception 
h e Destructeur x = -8.3
d
~~~

</details>

<details>
<summary>la valeur 17</summary>

~~~text
Autre exception 
h e Destructeur x = -8.3
d
~~~

</details>
