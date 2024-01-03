"""
Examen de Méthodologie en programmation


Session Septembre 2023

Question 1


Écrivez une fonction sum_sans_twenties(a, b, c) qui renvoie la
somme de trois arguments entiers a, b et c. Cependant, n'incluez
aucun entier dans la somme si celui-ci se trouve dans la plage [20,
29] (inclus).
Exemple : (20, 25, 30) ⇒ 30 est valide! 20 et 25 sont exclus.
Proposez des tests.
"""
# Exemple détaillé de réponse : On peut imaginer une première fonction qui filtre la liste pour enlever les occurrences entre 20 et 29 :
def filter_twenties1(maListe):
    # initialisation de la nouvelle liste
    newListe = []
    # on parcourt l'ancienne liste avec une boucle for
    for number in maListe:
        # on ajoute tous les nombres qui ne sont pas entre 20 et 29 inclus :
        if number < 20 or number > 29:
            newListe.append(number)
    # on retourne la liste une fois la boucle effectuée
    return newListe

def sum_sans_twenties1(maListe):
    # on commence par enlever les éléments de la liste entre 0 et 20
    liste_filtree = filter_twenties1(maListe)
    return sum(liste_filtree)

# Exemple de résolution en deux lignes (qui font la même chose que précédemment): 

def filter_twenties(maListe):
    return [x for x in maListe if x < 20 or x > 29]


def sum_sans_twenties(maListe):
    return sum(filter_twenties(maListe))

# on peut même le faire en une seule ligne 

def sum_sans_twenties2(maListe):
    return sum([x for x in maListe if not(20 <= x <= 29 )])


# tests : 

l1 = [20, 25, 30]
l2 = [15, 29, 1]
l3 = [-20, -15]
l4 = [22, 23]

print(sum_sans_twenties(l1)) # attendu 30
print(sum_sans_twenties(l2)) # attendu 16
print(sum_sans_twenties(l3)) # attendu -35
print(sum_sans_twenties(l4)) # attendu 0

print(sum_sans_twenties1(l1)) # attendu 30
print(sum_sans_twenties1(l2)) # attendu 16
print(sum_sans_twenties1(l3)) # attendu -35
print(sum_sans_twenties1(l4)) # attendu 0

print(sum_sans_twenties2(l1)) # attendu 30
print(sum_sans_twenties2(l2)) # attendu 16
print(sum_sans_twenties2(l3)) # attendu -35
print(sum_sans_twenties2(l4)) # attendu 0
"""
Question 2


Écrivez une fonction delDupes qui prend une chaîne de
caractères en tant que paramètre et renvoie la chaîne de
caractères sans espaces et sans aucune lettre en double.
Exemple : delDupes("banana") renvoie la chaîne "ban" (les autres
“a” et “n” sont en double), et delDupes("python programming")
renvoie la chaîne "pythonrgami".
Proposez des tests.
"""

def delDupes(mot):
    nouveauMot = ""
    for letter in mot:
        if letter not in nouveauMot and letter != " ":
            nouveauMot += letter
    return nouveauMot

mot1 = "banana"
mot2 = "python programing"

print(delDupes(mot1)) # attendu ban
print(delDupes(mot2)) # pythonrgami
print(delDupes("aaaaaaaaaaaaaaaaaa")) # attendu a
print(delDupes(" ")) # attendu ""