# Operateurs sur hh:mm 🕔

Soient la déclaration et le code suivant

~~~cpp
struct HeureMinute {
   int8_t heure;
   int8_t minute;
};

HeureMinute saisie(const string& msg) {
   HeureMinute hm;
   bool erreur;
   do {
      cout << msg;
      cin >> hm;
      erreur = cin.fail();
      cin.clear();
      cin.ignore(numeric_limits<streamsize>::max(), '\n');
   } while (erreur);
   return hm;
}

HeureMinute hm1 = {12, 34};
HeureMinute hm2 = {21, 43};

cout << boolalpha;
cout << hm1 << " <  " << hm2 << "  : " << (hm1 <  hm2) << endl;
cout << hm1 << " >  " << hm2 << "  : " << (hm1 >  hm2) << endl;
cout << hm1 << " <= " << hm2 << "  : " << (hm1 <= hm2) << endl;
cout << hm1 << " >= " << hm2 << "  : " << (hm1 >= hm2) << endl;
cout << hm1 << " == " << hm2 << "  : " << (hm1 == hm2) << endl;
cout << hm1 << " != " << hm2 << "  : " << (hm1 != hm2) << endl;

cout << hm1 << " +  " << hm2 << "  : " << (hm1 +  hm2) << endl;
cout << hm1 << " +  " << 44  << "     : " << (hm1 +  44 ) << endl;
cout << 44  << "    +  " << hm1 << "  : " << (44  +  hm1) << endl;
cout << hm1 << " += "  << 2 << "      : " << (hm1+=2 )    << endl;

cout << "++" << hm1  << "\t\t: " << ++hm1 << endl;
cout << hm1  << "++" << "\t\t: " << hm1++ << endl;
cout << hm1 << endl;

cout << endl;
HeureMinute hm3 = saisie("heure [hh:mm]: ");
cout << "votre saisie : " << hm3 << endl;
~~~

Écrire le code nécessaire afin que le code produise ceci.

~~~
12:34 <  21:43  : true
12:34 >  21:43  : false
12:34 <= 21:43  : true
12:34 >= 21:43  : false
12:34 == 21:43  : false
12:34 != 21:43  : true
12:34 +  21:43  : 34:17
12:34 +  44     : 13:18
44    +  12:34  : 13:18
12:34 += 2      : 12:36
++12:36         : 12:37
12:37++         : 12:37
12:38

heure [hh:mm]: 12 34
heure [hh:mm]: 12:34
votre saisie : 12:34

~~~

<details>
<summary>Solution</summary>

~~~cpp
#include <iostream>
#include <cstdint>
#include <limits>
using namespace std;

struct HeureMinute {
   int heure;
   int8_t minute;
};

bool operator< (const HeureMinute& lhs, const HeureMinute& rhs) {
   if (lhs.heure != rhs.heure)
      return lhs.heure < rhs.heure;
   return lhs.minute < rhs.minute;
}

bool operator== (const HeureMinute& lhs, const HeureMinute& rhs) {
   return lhs.heure   == rhs.heure
      and lhs.minute  == rhs.minute;
}

// Tous les autres opérateurs de comparaisons peuvent être déduits à partir
// de < et == (avec l'appel à un seul de ces deux opérateurs)
bool operator> (const HeureMinute& lhs, const HeureMinute& rhs) {
   return rhs < lhs;
}

bool operator<= (const HeureMinute& lhs, const HeureMinute& rhs) {
   return !(rhs < lhs); // Éviter rhs < lhs or rhs == lhs
}

bool operator>= (const HeureMinute& lhs, const HeureMinute& rhs) {
   return !(lhs < rhs);
}

bool operator!= (const HeureMinute& lhs, const HeureMinute& rhs) {
   return !(lhs == rhs);
}

HeureMinute operator+ (const HeureMinute& lhs, const HeureMinute& rhs) {
   return { lhs.heure + rhs.heure + (lhs.minute + rhs.minute) / 60,
            int8_t((lhs.minute + rhs.minute) % 60)};
}

HeureMinute& operator+= (HeureMinute& hm, int8_t minute) {
   hm = {hm.heure + (hm.minute + minute) / 60,
          int8_t((hm.minute + minute) % 60)};
   return hm;
}

HeureMinute operator+ (HeureMinute hm, int8_t minute) {
   return hm += minute;
}

HeureMinute operator+ (int8_t minute, HeureMinute hm) {
   return hm += minute;
}

HeureMinute& operator++ (HeureMinute& hm) {
   return hm += 1;
}

HeureMinute operator++ (HeureMinute& hm, int) {
   HeureMinute tmp = hm;
   ++hm;
   return tmp;
}

ostream& operator<< (ostream& os, const HeureMinute& h) {
   return os << +h.heure << ":" << +h.minute;
}

istream& operator>> (istream& is, HeureMinute& h) {
   char c;
   is >> h.heure;

   is >> c;
   if (c != ':') {
      is.setstate(ios::failbit);
   }

   int  valeur; // sinon risque de lecture d'un char avec int8_t
   is >> valeur; 
   if (valeur >= 60) {
      cout << valeur << endl;
      cout << "fail 60" << endl;
      is.setstate(ios::failbit);
   }
   else
      h.minute = int8_t(valeur);


   return is;
}

HeureMinute saisie(const string& msg) {
   HeureMinute hm;
   bool erreur;
   do {
      cout << msg;
      cin >> hm;
      erreur = cin.fail();
      cin.clear();
      cin.ignore(numeric_limits<streamsize>::max(), '\n');
   } while (erreur);
   return hm;
}

int main() {
  HeureMinute hm1 = {12, 34};
  HeureMinute hm2 = {21, 43};

  cout << boolalpha;
  cout << hm1 << " <  " << hm2 << "  : " << (hm1 <  hm2) << endl;
  cout << hm1 << " >  " << hm2 << "  : " << (hm1 >  hm2) << endl;
  cout << hm1 << " <= " << hm2 << "  : " << (hm1 <= hm2) << endl;
  cout << hm1 << " >= " << hm2 << "  : " << (hm1 >= hm2) << endl;
  cout << hm1 << " == " << hm2 << "  : " << (hm1 == hm2) << endl;
  cout << hm1 << " != " << hm2 << "  : " << (hm1 != hm2) << endl;

  cout << hm1 << " +  " << hm2 << "  : " << (hm1 +  hm2) << endl;
  cout << hm1 << " +  " << 44  << "     : " << (hm1 +  44 ) << endl;
  cout << 44  << "    +  " << hm1 << "  : " << (44  +  hm1) << endl;
  cout << hm1 << " += "  << 2 << "      : " << (hm1+=2 )    << endl;

  cout << "++" << hm1  << "\t\t: " << ++hm1 << endl;
  cout << hm1  << "++" << "\t\t: " << hm1++ << endl;
  cout << hm1 << endl;

  cout << endl;
  HeureMinute hm3 = saisie("heure [hh:mm]: ");
  cout << "votre saisie : " << hm3 << endl;
}~~~

------------------------------------------------------------

</details>

🤔 Pourrions-nous *simplifier* l'écriture des opérateurs de comparaison?

<details>
<summary>Solution</summary>

En profitant de la comparaison lexicographique des structures, comme nous le verrons dans le chapitre consacré aux classes, que l'on peut écrire simplement:
~~~cpp
struct HeureMinute {
   int8_t heure;
   int8_t minute;
   auto operator<=>(const HeureMinute& rhs) const = default;
};
~~~

On a alors les 6 opérateurs de comparaisons définis!

</details>
