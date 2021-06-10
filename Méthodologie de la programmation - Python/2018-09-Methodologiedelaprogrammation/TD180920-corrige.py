# -*- coding: utf-8 -*-

from collections import defaultdict

groupes = defaultdict(set)  # enregistre les equipes de chaque groupe
gagne = defaultdict(int)    # compte des matches gagnes
perd = defaultdict(int)     # compte des matches perdus
null = defaultdict(int)     # compte des matches nulls
bp = defaultdict(int)       # compte des buts pour
bc = defaultdict(int)       # compte des buts contre

with open('results.txt', 'r') as fp:
    for line in fp:
        # parsing des valeurs
        grp = line[1:2]
        e1, e2, score = line[4:].strip().split(', ')
        # convertit le nombre de buts en entier
        s1, s2 = map(int, score.split(' - '))
        # classe les equipes par groupes
        groupes[grp].update([e1, e2])
        # enregistre les resultats
        if s1 > s2:
            gagne[e1] += 1
            perd[e2] += 1
        elif s1 < s2:
            gagne[e2] += 1
            perd[e1] += 1
        else:   #null
            null[e1] += 1
            null[e2] += 1
        # compte des buts
        bp[e1] += s1
        bc[e2] += s1
        bc[e1] += s2
        bp[e2] += s2

def points(eq):
    return 3 * gagne[eq] + 1 * null[eq]

def diff(eq):
    return bp[eq] - bc[eq]

with open('stats.txt', 'w') as fp:
    for g in sorted(groupes.keys()):
        print >>fp, 'Groupe %s\tG\tN\tP\tBP\tBC\t+/-\tPTS' % g.ljust(9)
        for eq in sorted(groupes[g], key=lambda e: (points(e), diff(e)), reverse=True):
            cols = [eq.ljust(17), gagne[eq], null[eq], perd[eq], bp[eq], bc[eq], diff(eq), points(eq)]
            print >>fp, '\t'.join(map(str, cols))
        print >>fp
