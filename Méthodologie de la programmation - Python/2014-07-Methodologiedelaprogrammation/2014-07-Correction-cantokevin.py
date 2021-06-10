# CANTO Kevin 15608801

D = []

for ligne in open("mots.txt") :
	ligne = ligne.split()
	D.append([ligne[1], ligne[0]])

inverse = open("inverse.txt", "w")

for L in sorted(D) :
	inverse.write(L[0] + "\t" + L[1] + "\n")

inverse.close()

for ligne in open("inverse.txt") :
	print ligne,

# autre version

dic = []

for ligne in open("mots.txt") :
	ligne = ligne.split()
	dic.append([ligne[1], ligne[0]])

inverse = open("inverse.txt", "w")

for element in sorted(dic) :
	inverse.write("\t".join(element)+"\n")

inverse.close()

for element in open("inverse.txt") :
	print element,
