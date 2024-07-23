#import "@preview/equate:0.2.0": equate
#import "@preview/showybox:2.0.1": showybox
#import "@preview/lovelace:0.3.0": *
#import "@preview/ilm:1.1.2": *

#show: ilm.with(
  title: [Math Exam Preparation],
  author: "Roiban Marius-Alexandru",
  date: datetime(year: 2024, month: 07, day: 22),
  abstract: [],
  preface: [],
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true)
)

#let pseudocodeblock(title, code) = box[#text(
  font: "FiraCode Nerd Font Mono", 
  ligatures: true
)[
  #showybox(
    shadow: (
      offset: 3.5pt
  ),
  title: title,
  [#code]
  )
]]

#let CQFD = box[$space square.filled$]


#pseudocodeblock("Euclid's Algorithm", [
    #pseudocode-list(hooks: .5em)[
      + *def* euclid_division(a,b):
        + sum = 0
        + *whilst* sum <= a:
          + sum += b
        + *return* a - sum + b
    ]
    #pseudocode-list(hooks: .5em)[
      + *def* pgcd(a, b):
        + *if* b == 0:
          + *return* a
        + r = euclid_division(a, b)
        + *return* pgcd(b, r)
    ]
])


#showybox(
  shadow: (
    offset: 3.5pt,
  ),
  title: "Division by 9",
  [*For $a=10^0a_0+10^1a_1+...+10^n a_n$ prove that $9 bar a equiv 9 bar sum_(i=0)^n 10^i a_i$.*\ \
    We want to show that if a number $n$ is divisible by 9 then the number modulo 9 should equal 0.
    $
      n % 9 = 0 space space space space &#[if 9 $bar$ n and vice-versa]
    $

    We want then to prove that $(sum_(i=0)^n 10^i dot a_i)%9=0$ to prove that $9 bar sum_(i=0)^n 10^i dot a_i$.

    $
      (sum_(i=0)^n 10^i dot a_i)%9&=0\
                    &= (a_0+10^1 dot a_1 + ... +10^n dot a_n)%9 \
                    &=(a_0)%9+(10^1 dot a_1)%9+...+(10^n dot a_n)%9 \
                    &= 0 + 0 + ... + 0 \
                    &= 0 #CQFD
    $ <sum-mod-9>
    We showed that $9 bar n equiv 9 bar sum_(i=0)^n 10^i dot a_i$],
)

= Exercices
== Exercice 1
$9 bar 99 &equiv 9 bar (10^0 dot 9 + 10^1 dot 9)$

We know that $99 % 9 = 0$. Now we want to prove that the sum
$
  (sum_(i=0)^1 10^i dot a_i)%9&=0 \
&= (9 + 10^1 dot 9) % 9 \
&= (9%9)+(90%9) \
&= 0+0\
&= 0 #CQFD
$

== Exercice 4
Pour les paires (a, b) suivantes, calculer pgcd(a, b) à l’aide de l’algorithme d’Euclide et trouver x, y tels que ax + by = pgcd(a, b).\

+ a = 1287, b = 4004
#let pgcd(a, b) = box[pgcd(#a, #b)]
D'abord calculons le pgcd(1287, 4004)
$
&#pgcd("1287","4004") &&= 0 + 1287 \
&#pgcd("4004","1287") &&= 3861 + 143 \
&#pgcd("1287", "143") &&= 1287 + 0 \
&#pgcd("143", "0") &&= 143 #CQFD
$

Trouvons maintenant $(x,y)$ pour calculer l'equation
$
1287x + 4004y&=143 \
1287x + 4004 dot 1&= 143\
4004 - 143 &= 1287x \
3861 &= 1287x \
3861/1287&=x=3 #CQFD
$
On a trouvé comme solution, $x=3$ et $y=1$.

#pagebreak()
= Graphes
#showybox(
  shadow: (
    offset: 3.5pt,
  ),
  title: "Euler's Formula", 
  [
    On dit qu'un graphe est planaire lorsque la formule d'Euler est 
    satisfaite:
    $
    v-e+a=2
    $
    Oú $bar V bar=v, bar E bar=e$ et $a$ est le nombre de faces.
  ]
)
== Exercices
=== Exercice 11 
On a trois maisons et trois usines. La première usine fournit de l’eau, la deuxième
du gaz et la troisième de l’électricité. On désire relier chacune des trois maisons aux trois usines
pour qu’elles aient accès à l’eau, au gaz et à l’électricité. Une contrainte supplémentaire est que les
tuyaux ne doivent jamais se croiser. Est-ce possible ?

#align(center)[#image("img/image_372.png", height:30%, width: auto)]

#let showbox(title, body) = box()[
  #showybox(
    shadow: (
      offset:3.5pt
    ), title: title,
    [#body]
  )
]

On sait qu'on peut utiliser la formule d'Euler pour vérifier la planarité d'un graphe, on montrant la planarité du graphe on a aussi prouvé qu'il n'existe aucun croisement entre les arrêtes du graphes (Donc, il n'y a aucun croisement entre les tuyaux!).
  $
  bar V bar - bar E bar + f &= 2 \
  6 - 9 + f &= 2 \
  f &= 2 -6 + 9 \
  f &= 5
  $
  Après avoir calculer la formule d'Euler, on a trouvé qu'il faut que notre graphe contient 5 faces. 

  #showbox("Preuve par l'absurde",[
    Imaginons que la formule d'Euler est respectée et donc il y a un nombre de faces equivalent a 5 dans notre graphe.

    Dans un graphe biparti $K_(3,3)$ on sait qu'il n'est pas possible de créer un face avec le nombre minimal de 3 arrêtes, nous auront à la place un quadrilatère formé par 4 arrêtes.

    Donc, on peut calculer le nombre minimal de faces à partir de ces données
    $
    2 dot (bar E bar) / 4 &equiv 2 dot 9/4  \ &= 4.5 
    $

    Ceci rentre en contradiction avec le nombre de faces necessaire pour prouver que le graphe est planaire, donc, ce n'est pas possible de ne pas avoir des tuyaux qui ne se croisent pas. #CQFD
  ])
=== Exercice 12
Soit $G$ un graphe dont les sommets sont les entiers $1, 2, 3, ..., n$ et tel que l’arête
$p q$ existe si et seulement si $p != q$ et $p + q$ est impair.

(a) Montrer que χ($G$) = 2, autrement dit que le graphe est biparti.
#figure(
  image("img/image_373.png", height: 30%),
  caption: [Le graphe G]
)
#showbox(
  "Preuve par l'absurde",
  [
    On sait que toute arrête entre 2 sommets $(a,b)$ a existe si $a + b in I$ avec $I$ l'ensemble des nombres impairs et $P$ l'ensemble des nombres pairs.

    Alors imaginons il existe une arrête entre 2 nombres paires ou impaires, leur somme serra d'office paire car 
    $
    P + P &= P \
    I + I &= P
    $

    Ceci va en contradiction avec la définition de notre graphe et donc on va necessiter d'une 3eme couleur, alors χ($G$)$>2$. #CQFD
  ]
)

(b) Que se passe-t-il si “impair” est remplacé par “premier” dans la définition ? Donner l’allure et
le nombre chromatique de ce graphe.

$
p &!= q\
p + q &in #[Prime]
$

#figure(
  image("img/image_374.png", height: 10%),
  caption: [Le graphe $G prime $]
)<G-prime>

Dans ce genre de graphe, nous avons tout les nombres premiers comme impaires sauf le nombre 2.
Donc, le graphe G a priori suit une coloriation simmilaire à la situation de base, impliquant que la coloration soit $chi(G)<=2$. 
De plus, prenons le graphe $G prime$ dans la @G-prime, ce graphe contient au minimum 1 arrête car $1+2=3$ et donc necessite 2 couleur. Donc, $chi(G prime)=2$.
En tenant compte de $chi(G)<=2 and chi(G prime)=2$ on conclue que $chi(G)=2$ #CQFD

\
\

(c) Que se passe-t-il si “impair” est remplacé par “pair” dans la définition ? Donner l’allure et le
nombre chromatique de ce graphe.

$
p &!= q\
p + q &=in #[Paire]
$

On sait que la somme de nombre pair est paire et la somme de nombre impair est paire aussi

    $
    P + P &= P \
    I + I &= P
    $

Ceci nous donnera 1 graphe ayant 2 composantes connexes, une partie contenant les nombres pairs et l'autre les nombres impairs.
On sait qu'il faudra $chi(G prime prime)=ceil(n/2)$ couleurs pour chaque sous graphe. 

=== Exercice 13
Trouver un contre-exemple à l’énoncé (faux) suivant :\
#align(center)[Tout graphe simple à 8 sommets et 2-régulier est eulérien]
*Solution:*
#figure(
  image("img/image_375.png", height: 15%),
  caption: [Un graphe ayant 2 composantes connexes]
)

=== Exercice 14 
Quel est le nombre chromatique du graphe de Petersen ?

*Solution*

Le graphe de Petersen a besoin de $chi(G)=3$ couleurs pour effectuer un coloriage des sommets.

=== Exercice 15
Soit G un graphe simple. Montrer que G est complet si et seulement si $bar E bar = binom(bar V bar,2)$

*Solution*

Il y a double implication, si le graph G est complet, ça signifie que le nombre d'arrêtes devrait être équivalent à $bar E bar = binom(bar V bar,2)$. Et si le nombre $bar E bar = binom(bar V bar,2)$, ceci signifie alors que le graph G est complet. 

Il faudra alors prouver ces deux implications, l'une par l'une.

*(1) Implication: G complet $arrow$ $bar E bar = binom(bar V bar,2)$*

Si le graph G est complet, ça signifie que pour chaque sommet, il y a $bar V bar -1$ sommet connectés.  Et comme le graph est complet, chaque sommet sera lui aussi connecté à tout autre sommet. Donc si on a un total de $n$ sommets, alors on aura $bar V bar dot (bar V bar -1) $ connexion au total. 

Il faut aussi tenir en compte que chaque sommet sera compté deux fois. Donc, après, on devra diviser par deux pour avoir le nombre total d'arrêtes $ bar E bar$.
$
bar E bar &= binom(bar V bar, 2)\
&= frac(bar V bar  dot (bar V bar -1), 2)
$

*(2) Implication: $bar E bar = binom(bar V bar,2) arrow$ G complet*

Ce binôme nous dit que le nombre total d'arrêt $bar E bar$ est équivalent en nombre de combinaisons possibles entre chaque sommet. Donc, ceci implique qu'il est à un nombre total de connexions possible entre chaque sommet.  qui est équivalent au nombre d'arrêtes $bar E bar$. 

Et donc, si cette égalité est vérifiée, alors on conclut que le graph G est complet. #CQFD

=== Exercice 16
Pour quelles valeurs de $n ∈ NN _0$ existe-t-il un graphe à $n$ sommets dont tous les sommets sont de degré exactement 3 ? Justifier votre réponse.

*Solution*

On sait que dans un graphe complet, chaque sommet sera connecté à tout autre sommet. Donc si on a $N$ sommet, tout sommet sera connecté à $N - 1$ sommet. Donc si on veut avoir un degré exactement égal à 3, on aura 4 sommets. 
