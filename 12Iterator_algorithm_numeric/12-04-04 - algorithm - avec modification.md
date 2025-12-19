# Algorithm - avec modification
Soient la fonction d'affichage et les conteneurs initialisés de la manière suivante:

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


array  a {1, 2, 3};
vector v {1, 2, 3, 4, 5, 1, 2, 3, 4};
~~~

Que produisent les codes ci-après ?

<br>

~~~cpp
// no 1
copy(v.begin(), v.end(), a.begin());

display(a.begin(), a.end());
~~~

<details>
<summary>Solution</summary>

~~~
[1, 2, 3]
~~~

⚠️ des valeurs ont été écrites au delà du array `a`

------------------------------

</details>

~~~cpp
// no 2
copy(a.begin(), a.end(), v.rbegin());

display(v.begin(), v.end());
~~~

<details>
<summary>Solution</summary>

~~~
[1, 2, 3, 4, 5, 1, 3, 2, 1]
~~~

------------------------------

</details>

~~~cpp
// no 3
int mult(int a, int b) { return a * b; }
transform(a.begin(), a.end(), a.begin(), a.begin(), mult);

display(a.begin(), a.end());
~~~

<details>
<summary>Solution</summary>

~~~
[1, 4, 9]
~~~

------------------------------

</details>

~~~cpp
// no 4
int mult(int a, int b) { return a * b; }
transform(a.begin(), a.end(), v.begin(), v.begin(), mult);

display(v.begin(), v.end());
~~~

<details>
<summary>Solution</summary>

~~~
[1, 4, 9, 4, 5, 1, 2, 3, 4]
~~~

------------------------------

</details>

~~~cpp
// no 5
remove(v.begin(), v.end(), 5);

display(v.begin(), v.end());
~~~

<details>
<summary>Solution</summary>

~~~
[1, 2, 3, 4, 1, 2, 3, 4, 4]
~~~

------------------------------

</details>

~~~cpp
// no 6
remove(v.begin(), v.end(), 2);

display(v.begin(), v.end());
~~~

<details>
<summary>Solution</summary>

~~~
[1, 3, 4, 5, 1, 3, 4, 3, 4]
~~~

------------------------------

</details>
