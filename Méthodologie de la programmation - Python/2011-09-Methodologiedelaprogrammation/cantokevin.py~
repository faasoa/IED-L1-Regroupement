# CANTO Kevin 15608801

# 1
# Meilleure version
for ligne in open("data.txt") :
	print "\t".join(ligne.split())

# 1
# Autre version pas tout à fait généralisée
L = []
for ligne in open("data.txt") :
	ligne = ligne.split()
	L.append([ligne[0], ligne[1], ligne[2], ligne[3]])

for ligne in (L) :
	print ligne[0]+"\t"+ligne[1]+"\t"+ligne[2]+"\t"+ligne[3]+"\n",



for ligne in open("data.txt") :
	ligne = ligne.split()
	
# 2
# Meilleure version

M = []
for ligne in open("data.txt") :
	M.append(ligne.split())

for y in range(len(M[0])) :
   for x in range(len(M)) :
      print '%02s\t' % M[x][y],
      
   print

# 2
# Autre version
M = []
for ligne in open("data.txt") :
	M.append(ligne.split())

Z = []
newM = []
for y in range(len(M[0])) :
   for x in range(len(M)) :
      Z += [M[x][y]]
      
   newM += [Z]
   Z = []

for ligne in (newM) :
	print "\t".join(ligne)

