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


~~~cpp
// no 1
display(v.begin(), v.end());
~~~

<details>
<summary>Solution</summary>

~~~
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
~~~

------------------------------

</details>

~~~cpp
// no 2
display(v.end() - 1, v.end());
~~~

<details>
<summary>Solution</summary>

~~~
[10]
~~~

------------------------------

</details>

~~~cpp
// no 3
display(v.end(), v.end());
~~~

<details>
<summary>Solution</summary>

~~~
[]
~~~

------------------------------

</details>

~~~cpp
// no 4
display(v.begin() + 5, v.end() - 5);
~~~

<details>
<summary>Solution</summary>

~~~
[]
~~~

------------------------------

</details>

~~~cpp
// no 5
display(v.begin() + 5, v.begin() + 4);
~~~

<details>
<summary>Solution</summary>

~~~
[6, 7, 8, 9, 10, ?, ?, ?, ..., ?]
~~~

⚠️ les itérateurs sont croisés => boucle infinie

------------------------------

</details>

~~~cpp
// no 6
display(tab, tab + 3);
~~~

<details>
<summary>Solution</summary>

~~~
[1, 2, 3]
~~~

------------------------------

</details>

~~~cpp
// no 7
display(tab, tab + 2);
~~~

<details>
<summary>Solution</summary>

~~~
[1, 2]
~~~

------------------------------

</details>

~~~cpp
// no 8
display(tab, tab + 10);
~~~

<details>
<summary>Solution</summary>

~~~
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
~~~

------------------------------

</details>

~~~cpp
// no 9
display(tab, tab + 12);
~~~

<details>
<summary>Solution</summary>

~~~
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, ?, ?]
~~~

⚠️ en dehors du tableau => indéterminé

------------------------------

</details>

~~~cpp
// no 10
display(tab + 2, tab + 5);
~~~

<details>
<summary>Solution</summary>

~~~
[3, 4, 5]
~~~

------------------------------

</details>

~~~cpp
// no 11
display(tab + 5, tab + 2);
~~~

<details>
<summary>Solution</summary>

~~~
[6, 7, 8, 9, 10, ?, ?, ?, ?, ..., ?]
~~~

⚠️ les itérateurs sont croisés => boucle infinie



