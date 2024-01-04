# Question 1 : 

# listes de paires d'entiers (pour tester)


l1 = [(1,2), (23, 25), (12, 16)] # cas simple : attendu (23,25)
l2 = [(1,2), (25, 23), (12, 12)] # cas avec 1er élément < 2eme element : attendu (23,25)
l3 = [(1,2), (23, 25), (12, 16), (26, 22), (22, 26)] # cas plus complexe avec plusieurs moyennes attendu (22, 26)
l4 = [(-2, -1), (-1, -1)] #attendu (-1, -1)
l5 = [(-1, -1)] #attendu (-1, -1)


def moy (paire):
    return (paire[0] + paire[1]) / 2

def extraitPlusGrandeMoyenne(maListe : list):
    # gestion des listes vides : 
    if not maListe:
        return None
    paire = maListe[0]
    for element in maListe:
        if moy(element) > moy(paire) :
            paire = element
        elif moy(element) == moy(paire) and element[1] > paire[1]: 
            paire = element
    return paire

# tests
print(extraitPlusGrandeMoyenne(l1))
print(extraitPlusGrandeMoyenne(l2))
print(extraitPlusGrandeMoyenne(l3))
print(extraitPlusGrandeMoyenne(l4))
print(extraitPlusGrandeMoyenne(l5))


# Question 2 : 

with open("Q1Resultat.txt", "w+") as file_out:
    file_out.write(str(extraitPlusGrandeMoyenne(l3)))


# Question 3 : 

l6 = [(2, 2), (3, 4), (5, 5), (6, 7), (8, 8)]

# plus facile à comprendre : 
def recupereNonIdentiques1(maListe):
    listeReponse = []
    for paire in maListe:
        if paire[0] != paire [1]:
            listeReponse.append(paire)
    return listeReponse

# pour ceux qui sont plus à l'aise en python : 
def recupereNonIdentiques(maListe):
    return [x for x in maListe  if x[0] != x[1]]

print(recupereNonIdentiques1(l6))
print(recupereNonIdentiques(l6))