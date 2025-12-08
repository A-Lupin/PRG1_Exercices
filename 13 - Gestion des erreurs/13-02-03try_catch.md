# Terminaison de programme (3)

Que va afficher le programme ci-dessous ?

1.  
~~~cpp
#include <iostream>
using namespace std;

void f();

int main() {
   try {
      f();
   } catch (int n) {
      cout << "Exception int dans main : " << n << endl;   
   } catch (...) {
      cout << "Exception autre que int dans main" << endl;   
   }

   cout << "Fin du programme\n";   
}

void f() {
   try {
      int n = 1;
      throw n;
   } catch (int n) {
      cout << "Exception int dans f : " << n << endl;   
      throw;
   }
}
~~~

<details>
<summary>Solution</summary>

~~~text
Exception int dans f : 1
Exception int dans main : 1
Fin du programme
~~~

</details>


2.  
~~~cpp
#include <iostream>
using namespace std;

void f();

int main() {

   try {
      f();
   } catch (int n) {
      cout << "Exception int dans main : " << n << endl;   
   } catch (...) {
      cout << "Exception autre que int dans main" << endl;   
   }

   cout << "Fin du programme\n";   
}

void f() {
   try {
      double x = 1.;
      throw x;
   } catch (int n) {
      cout << "Exception int dans f : " << n << endl;   
      throw;
   }
}
~~~

<details>
<summary>Solution</summary>

~~~text
Exception autre que int dans main
Fin du programme
~~~

</details>

3.  
~~~cpp
#include <iostream>
using namespace std;

void f() noexcept;

int main() {

   try {
      f();
   } catch (int n) {
      cout << "Exception int dans main : " << n << endl;   
   } catch (...) {
      cout << "Exception autre que int dans main" << endl;   
   }

   cout << "Fin du programme\n";   
}

void f() noexcept {
   try {
      int x = 1.;
      throw x;
   } catch (int n) {
      cout << "Exception int dans f : " << n << endl;   
      throw;
   }
}
~~~

<details>
<summary>Solution</summary>

Le compilateur n'a pas à générer de code pour intercepter les exceptions qui seraient lancées par `f`, car elle est qualifiée `noexcept`. Dans `main` les blocs `catch` peuvent donc éliminés à la compilation et l'exception propagée par `f` ne pas être interceptée. S'il n'est pas cohérent de déclarer la fonction `noexcept`, il peut être cependant raisonnable de prévoir dans la fonction un bloc `try catch`, pour autant que toutes les exceptions levées dans la fonction soient traitées par la fonction et non propagées au processus appelant.
 
~~~text
Exception int dans f : 1
terminate called after throwing an instance of 'int'
Abandon (core dumped)
~~~

</details>
