# Fonctions surchargées (1 paramètre)

Que produisent les appels aux fonctions ci-dessous ?  
Indiquer les cas d'ambiguïté.

~~~cpp
double      f(signed char) { cout << "Fonction no 1"; return 0.; }
signed char f(int&)        { cout << "Fonction no 2"; return 0 ; }
int         f(const int&)  { cout << "Fonction no 3"; return 0 ; }
float       f(unsigned)    { cout << "Fonction no 4"; return 0 ; }
unsigned    f(double)      { cout << "Fonction no 5"; return 0 ; }
float       f(float&)      { cout << "Fonction no 6"; return 0.; }
~~~

---

~~~cpp
// no 1
f('a');
~~~

<details>
<summary>Solution</summary>

- `Fonction no 1` sur une machine avec `signed char` (type exact)  
- `Fonction no 3` sur une machine avec `unsigned char` (ajustement de type)

NB : la no 2 n'est pas possible (`int&` sur une constante `'a'`).

</details>

---

~~~cpp
// no 2
f(42);
~~~

<details>
<summary>Solution</summary>

- `Fonction no 3` (type exact)

</details>

---

~~~cpp
// no 3
int i = 42;
f(++i);	
~~~

<details>
<summary>Solution</summary>

Les opérateurs préfixés (`++i`, `--i`) retournent une **référence** sur la variable ([cppreference](https://en.cppreference.com/w/cpp/language/operators)).  

- `Fonction no 2`

</details>

---

~~~cpp
// no 4
int j = 42;
f(j--);	
~~~

<details>
<summary>Solution</summary>

Les opérateurs postfixés (`i++`, `i--`) retournent une **copie** de la variable ([cppreference](https://en.cppreference.com/w/cpp/language/operators)).  

- `Fonction no 3`

</details>

---

~~~cpp
// no 5
f(2ull);
~~~

<details>
<summary>Solution</summary>

`2ull` est un `unsigned long long`.  

4 fonctions sont candidates et il n'y a pas de priorité de choix → **ambiguïté** :  

- Fonction no 1 (conversion de `unsigned long long` → `signed char`)  
- Fonction no 3 (conversion de `unsigned long long` → `const int&`)  
- Fonction no 4 (conversion de `unsigned long long` → `unsigned`)  
- Fonction no 5 (conversion de `unsigned long long` → `double`)  

</details>

---

~~~cpp
// no 6
long   a;
double b;
f(a < b);
~~~

<details>
<summary>Solution</summary>

La comparaison `long` et `double` se fait via conversion de `long` en `double`.  
Ensuite la comparaison retourne un `bool`.  
En l'absence de correspondance exacte, il y a promotion `bool` → `int`.  

- `Fonction no 3`

</details>

---

~~~cpp
// no 7
float r = 2.f;
f(r *= 2.l);
~~~

<details>
<summary>Solution</summary>

L'opérateur `*=` prend un `float` en paramètre.  
Le `long double` `2.l` est donc converti en `float`.  
L'opérateur `*=` retourne une **référence** à la variable `r`.  
La fonction 6 est donc appelée, `r` étant une `float&`.  

- `Fonction no 6`

</details>

---

~~~cpp
// no 8
f(f(2u));
~~~

<details>
<summary>Solution</summary>

1. `f(2u)` appelle la Fonction no 4, qui retourne un `float` (valeur, pas référence).  
2. L'appel suivant est `f(float)`, qui correspond à la Fonction no 5 (`float` → `double`).  

- `Fonction no 5`

</details>

---

~~~cpp
// no 9
f('2') ? f(2.0) : f(-2.0); 
~~~

<details>
<summary>Solution</summary>

Comme vu précédemment, `f('2')` appelle soit :  
- la Fonction no 1 (machine avec `signed char`)  
- la Fonction no 3 (machine avec `unsigned char`)  

Ces deux fonctions retournent `false`, donc `f(-2.0)` est ensuite appelé, ce qui correspond à la Fonction no 5.  

- `Fonction no 1` et `Fonction no 5` **ou** `Fonction no 3` et `Fonction no 5`

</details>
