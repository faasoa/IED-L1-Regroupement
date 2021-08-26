# CANTO Kevin 15608801
# Meilleure version

L = []
M = []

for ligne in open("160617.data") :
	ligne = ligne.split()
	L.append([ligne[0], [float(x) for x in ligne[1:]]])

for element in (L) :
	M.append([round(sum(element[1])/len(element[1]), 1), element[0]])

for element in sorted(M) :
	print element[1], element[0]
















L = []
M = []
N = []

for ligne in open("160617.data") :
	ligne = ligne.split()
	L.append([ligne[0], ligne[1:]])

for element in L :
	M.append([element[0], (int(element[1][0]) + int(element[1][1]) + int(element[1][2]) + int(element[1][3]) + int(element[1][4]) + int(element[1][5]))/6.0])

for element in M :
	N.append([element[1], element[0]])

for element in sorted(N) :
	print element[1], element[0]
