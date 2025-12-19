# try/catch

Indiquer ce que va afficher chacun des programmes suivants : 

1.
~~~cpp
#include<iostream>
using namespace std;
int main() {
   try {
      throw 1;
   } catch (int e) {
      cout << "Dans catch (int) : valeur reçue = " << e << endl;
      throw 2.0;
   } catch (double e) {
      cout << "Dans catch (double e) : valeur reçue = " << e << endl;
   } catch (...) {
      cout << "Dans catch (...)" << endl;
   }
   cout << "Fin du programme" << endl;
}
~~~
<details>
<summary>Solution</summary>

Dans catch (int) : valeur reçue = 1<br>
terminate called after throwing an instance of 'double'<br>
<br> 
Abandon (core dumped) (ou un autre message dépendant du système d'exploitation)
</details>

2.
~~~cpp
#include<iostream>
using namespace std;
int main() {
   try {
      try {
         throw 1;
      } catch (int e) {
         cout << "Dans catch (int) : valeur reçue = " << e << endl;
         throw 2.0;
      } catch (...) {
         cout << "Dans catch (...)" << endl;
      }
   } catch (double e) {
      cout << "Dans catch (double) : valeur reçue = " << e << endl;
   }
   cout << "Fin du programme" << endl;
}
~~~
<details>
<summary>Solution</summary>

Dans catch (int) : valeur reçue = 1<br>
Dans catch (double) : valeur reçue = 2<br>
Fin du programme<br>

</details>

3.	
~~~cpp
#include<iostream>
using namespace std;
void f() {
   throw 'A';
}

int main() {
   try {
      try {
         f();
      } catch (int) {
         cout << "Dans catch (int) 1" << endl;
         throw;
      } catch (...) {
         cout << "Dans catch (...) 1" << endl;
         throw 65;  
      }
   } catch (int&) {
      cout << "Dans catch (int&)" << endl;
   } catch (int) {
      cout << "Dans catch (int) 2" << endl;
   } catch (const int) {
      cout << "Dans catch (const int)" << endl;
   } catch (...) {
      cout << "Dans catch (...) 2" << endl;
   }
   
   cout << "Fin du programme" << endl;
}
~~~
<details>
<summary>Solution</summary>

Dans catch (...) 1<br>
Dans catch (int&)<br>
Fin du programme<br>

</details>
