#!/usr/bin/env python
# coding=utf8


## Correction du TD du 2 Juin 2017


# Exercice 1
def transpose(mat):
    m = len(mat)    # nombre de lignes
    n = len(mat[0]) # nombre de colonnes
    # transpose les valeurs
    mt = [[mat[i][j] for i in range(m)]
          for j in range(n)]
    return mt

# Exercice 2
def write_sparse_matrix(mat, filename):
    fp = open(filename, 'w')
    # lit les lignes de la matrice
    for row in mat:
        # formate les valeurs des colonnes differentes de zero
        line = ["%d:%g" % (j, val)  # ou : str(j)+':'+str(val)
                for j, val in enumerate(row)
                if val != 0]
        # ecrit le resultat
        fp.write(' '.join(line) + '\n')
    fp.close()

# Exercice 3
def read_sparse_matrix(filename):
    lst = []
    fp = open(filename, 'r')
    # lit le fichier et stocke les valeurs dans une liste temporaire
    for i, line in enumerate(fp):
        row = [e.split(':') for e in line.strip().split(' ')]
        lst.append([(int(j), float(val)) for j, val in row])
    # recupere le nombre de lignes et de colonnes
    m = len(lst)                                    
    n = max(j for row in lst for j, _ in row) + 1
    # initialise la matrice creuse
    mat = [[0. for j in range(n)]
           for i in range(m)]
    # definit les valeurs
    for i, row in enumerate(lst):
        for j, val in row:
            mat[i][j] = val
    fp.close()
    return mat



## Tests

from pprint import pprint

# matrice rectangulaire pour le test
M = [[1, 4, 7, 5],
     [8, 2, 3, 0],
     [9, 7, 5, 4]]

# on affiche la transposee
print transpose(M)

sM = [   # matrice creuse pour le test
 [8, 0, 5, 0, 0, 0, 9, 0, 0, 8],
 [0, 0, 9, 0, 6, 0, 0, 0, 2, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 4],
 [1, 8, 0, 2, 1, 0, 0, 0, 0, 0],
 [0, 7, 0, 0, 0, 3, 0, 0, 0, 0]
]

# ecrit sM dans le fichier "sparse.mat"
write_sparse_matrix(sM, 'sparse.mat')

# charge et affiche la matrice (pprint permet un affichage plus joli)
pprint(read_sparse_matrix('sparse.mat'))
