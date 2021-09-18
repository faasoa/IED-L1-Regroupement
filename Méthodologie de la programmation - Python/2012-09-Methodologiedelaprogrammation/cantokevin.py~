# CANTO Kevin 15608801

examen = open("exam.text", "w")

for ligne in open("exam.csv") :
	ligne = ligne.split(",")
	examen.write(ligne[2][:-1].replace('"', "'")+", "+ligne[1].replace('"', "'")+", "+ligne[0]+"\n")

examen.close()




# CANTO Kevin 15608801

examen = open("exam.text", "w")

for ligne in open("exam.csv") :
	ligne = ligne.split(",")
	examen.write((ligne[2][:-1]+", "+ligne[1]+", "+ligne[0]+"\n").replace('"', "'"))

examen.close()
