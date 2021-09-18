# CANTO Kevin 15608801

A = []

for ligne in open("150529.nfo") :
	ligne = ligne.split()
	A.append([ligne[1], ligne[2], ligne[0], [float(x) for x in ligne[3:]]])

for L in sorted(A) :
	print L[2], L[1], L[0]

moyennes = open("150529 moyennes.nfo", "w")

for L in (A) :
	moyennes.write(L[2]+" "+L[0]+" "+L[1] +" "+str(sum(L[3])/len(L[3]))+"\n")

moyennes.close()

for ligne in open("150529 moyennes.nfo") :
	print ligne,
