# Terminaison de programme (2)

Que va afficher le programme ci-dessous, lorsque l'utilisateur saisit :

1. la valeur 1 ?
2. la valeur 2 ?
3. la valeur 3 ?
4. la valeur 4 ?
   
~~~cpp
#include <iostream>
#include <exception>
using namespace std;

void onExit() {
   cout << "Appel de exit\n";
}

void onTerminate() {
   cout << "Appel de terminate\n";
   exit(-1); // pour éviter que le programme ne "plante"
}

int main() {

   atexit(onExit);
   set_terminate(onTerminate);
   
   int n;
   float x;
   double y;
     
   cout << "Donnez un entier : ";
   cin >> n;
   
   try {
      switch (n) {
         case 1: throw n;
         case 2: x = n; throw x;
         case 3: y = n; throw y; 
      }
   } catch (int n) {
      cout << "catch(int n) : n = " << n << endl;   
   } catch (float x) {
      cout << "catch(float x) : x = " << x << endl;
      exit(-1);   
   }

   cout << "Fin du programme\n";
}
~~~


<details>
<summary>la valeur 1</summary>

~~~text
Donnez un entier : 1
catch(int n) : n = 1
Fin du programme
Appel de exit
~~~

</details>

<details>
<summary>la valeur 2</summary>

~~~text
Donnez un entier : 2
catch(float x) : x = 2
Appel de exit
~~~

</details>

<details>
<summary>la valeur 3</summary>

~~~text
Donnez un entier : 3
Appel de terminate
Appel de exit
~~~

</details>

<details>
<summary>la valeur 4</summary>

~~~text
Donnez un entier : 4
Fin du programme
Appel de exit
~~~

</details>
