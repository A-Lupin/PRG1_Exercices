# Carnet d'adresses

Soit la déclaration et l'instruction

~~~cpp
  array carnet {Personne{"Jean"s,   "Veuxplus"s, Date{ 7,  4, 1975}},
                Personne{"Alain"s,  "Verse"s,    Date{21, 12, 2018}},
                Personne{"Justin"s, "Ptipeu"s,   Date{ 1,  8, 2023}},
                Personne{"Rémi"s,   "Fasol"s,    Date{17,  5, 1957}}};

  vector livre {Personne{"Océane"s,  "Widmer"s, Date{ 7,  4, 1975}},
                Personne{"Armand"s,  "Cuche"s,  Date{21, 12, 2018}},
                Personne{"Jean"s,    "Baume"s,  Date{ 2,  4, 1646}},
                Personne{"Jean"s,    "Gette"s,  Date{23,  3, 1587}},
                Personne{"Pierre"s,  "Carré"s,  Date{17,  5, 1957}}};

  cout << carnet << livre << endl;
~~~

Écrire le code nécessaire afin d'afficher le carnet d'adresse comme suit :

~~~
prenom : Jean
nom    : Veuxplus
date   : 7.4.1975

prenom : Alain
nom    : Verse
date   : 21.12.2018

prenom : Justin
nom    : Ptipeu
date   : 1.8.2023

prenom : Rémi
nom    : Fasol
date   : 17.5.1957

prenom : Océane
nom    : Widmer
date   : 7.4.1975

prenom : Armand
nom    : Cuche
date   : 21.12.2018

prenom : Jean
nom    : Baume
date   : 2.4.1646

prenom : Jean
nom    : Gette
date   : 23.3.1587

prenom : Pierre
nom    : Carré
date   : 17.5.1957

~~~

<details>
<summary>Solution</summary>

~~~cpp
struct Date {
   uint8_t  jour;
   uint8_t  mois;
   uint16_t annee;
};

struct Personne {
   string prenom;
   string nom;
   Date   date;
};

ostream& operator<< (ostream& os, const Date& d) {
   os << (int)d.jour << "." << (int)d.mois << "." << d.annee;
// os << +d.jour << "." << +d.mois << "." << d.annee; // Variante
   return os;
}

ostream& operator<< (ostream& os, const Personne& p) {
   os << "prenom : " << p.prenom  << endl;
   os << "nom    : " << p.nom     << endl;
   os << "date   : " << p.date    << endl;
   return os;
}

template <typename T> // T doit être une classe avec itérateurs cbegin et cend
ostream& operator<< (ostream& os, const T & tab) {
   for(const auto & t : tab)
      os << t << endl;
   return os;
}
~~~

-----------------------------------------------------

</details>
