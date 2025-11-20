# Que produisent ces codes

Soit la fonction `display(..)` et les tableaux déclarés.

~~~cpp
template<typename Iterator>
void display(Iterator first, Iterator last) {
   cout << "[";
   for (Iterator it = first; it != last; ++it) {
      if (it != first) cout << ", ";
      cout << *it;
   }
   cout << "]\n";
}

vector<int> v{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
int tab[]  = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
~~~

Que produisent ces codes

<br>

------------------------------

</details>

~~~cpp
// no 12
template <typename T>
void f(const T tab[]) {
   vector<T> v (tab.begin(), tab.end());
   display(v.begin(), v.end());
}

f(tab);
~~~

<details>
<summary>Solution</summary>

⚠️ ne compile pas<br>
`tab` tel que reçu dans la fonction n'est qu'un **pointeur sur le tableau**.<br>
Il n'y a donc aucune méthode `tab.begin()` ou `tab.end()` à disposition.

------------------------------

</details>

~~~cpp
// no 13
template <typename T>
void f(const T tab[], size_t taille) {
   vector<T> v (tab.begin(), tab.begin() + taille);
   display(v.begin(), v.end());
}

// tab supposé déclaré dans le bloc de l'appel
f(tab, sizeof tab / sizeof(int));
~~~

<details>
<summary>Solution</summary>

⚠️ ne compile pas<br>
`tab` tel que reçu dans la fonction n'est qu'un **pointeur sur le tableau**.<br>
Il n'y a donc aucune méthode `tab.begin()` à disposition.

**NB** cette fois la taille a été passée en paramètre et utilisée ici `tab.begin() + taille`

------------------------------

</details>

~~~cpp
// no 14
template <typename T>
void f(const T tab[], size_t taille) {
   vector<T> v (tab, tab + taille);
   display(v.begin(), v.end());
}

// tab supposé déclaré dans le bloc de l'appel
f(tab, sizeof tab / sizeof(int));
~~~

<details>
<summary>Solution</summary>

~~~
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
~~~

👍 cette fois pas d'utilisation de `tab.begin()` ou `tab.end()`<br>mais de `tab` et `tab + taille` pour le constructeur de `v`.

------------------------------

</details>

~~~cpp
// no 15
display(v.rbegin(), v.rend());
~~~

<details>
<summary>Solution</summary>

~~~
[10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
~~~

------------------------------

</details>

~~~cpp
// no 16
display(v.rend(), v.rbegin());
~~~

<details>
<summary>Solution</summary>

⚠️ indéterminé, les itérateurs sont croisés

------------------------------

</details>

~~~cpp
// no 17
display(v.rbegin(), v.end());
~~~

<details>
<summary>Solution</summary>

⚠️ ne compile pas<br>
les itérateurs ne sont pas du même type<br>
- `v.rbegin()` => `vector<int>::reverse_iterator`<br>
- `v.end()` => `vector<int>::iterator`<br>

------------------------------

</details>

~~~cpp
// no 18
display(v.rbegin() + 1, v.rend() - 3);
~~~

<details>
<summary>Solution</summary>

~~~
[9, 8, 7, 6, 5, 4]
~~~

------------------------------

</details>
