# meilleure version

M = []

for ligne in open("prix.nfo") :
	ligne = ligne.split()
	M.append([ligne[0]] + [float(x) for x in ligne[1:]]) # M => [['Lesombre', 6.45, 1.65, 1.22, 2.21, 8.08, 2.18], ['Aupr\xc3\xa9', 6.67, 2.6, 1.34, 4.45, 7.47, 2.2], ['Casoni', 8.22, 5.0, 6.18, 2.5, 7.97, 4.22], ['Intercharm\xc3\xa9', 5.2, 4.36, 5.11, 1.63, 2.61, 7.9], ['Corail', 5.41, 8.52, 6.16, 9.06, 4.02, 9.74], ['SuperPue', 1.17, 8.55, 6.71, 8.93, 2.78, 4.39]]

moinscher = open("moins cher.nfo", "w")

for y in range(1, 7) :
	plus = 100
	index = 0
	for x in range(6) :
		if M[x][y] < plus : plus = M[x][y] ; index = x
	moinscher.write("enseigne : " + str(M[index][0]) + ", prix : " + str(M[index][y]) + "\n")

moinscher.close()










# autre version

enseignes = []

for ligne in open("prix.nfo") :
	ligne = ligne.split("\t")
	enseignes.append([ligne[0]] + [float(n) for n in ligne[1:] if n])

flux = open("mieux.nfo", "w")

for n in range(1, len(enseignes[0])) :
	mieux = ["", 10]
	for x in enseignes :
		if x[n] < mieux[1] :
			mieux = [x[0], x[n]]
	flux.write("produit " + str(n) + " : " + mieux[0] + ", " + str(mieux[1]) + "\n")

flux.close()

for ligne in open("mieux.nfo") :
	print ligne,



# autre version

flux = open("prix.nfo")
tout = flux.read().split("\n") # lis tout d'un coup !
flux.close()

enseignes = list() # démarre à vide

for ligne in tout : # fabrique la matrice
	if not ligne : continue # skip last (empty) linefeed
	data = ligne.split("\t") # explose la ligne
	data = [data[0]] + [float(n) for n in data[1:] if n]
	enseignes.append(data) # rajoute cette ligne

flux = open("mieux.nfo", "w")

for n in range(1, len(enseignes[0])) : # colonne n
	mieux = ["", 10] # démarre dans l'invraisemblable
	for x in enseignes : # à la ligne x
		if x[n] < mieux[1] : # si tu trouves moins cher
			mieux = [x[0], x[n]] # nouveau minimum
	info = "produit %i : %s, %s" % (n, mieux[0], mieux[1])
	flux.write(info + "\n")
	print info

flux.close()
