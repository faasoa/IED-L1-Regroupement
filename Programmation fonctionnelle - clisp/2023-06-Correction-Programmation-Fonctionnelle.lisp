; JUIN 2023

; Epreuve 1

; Soient deux listes plates, la première étant une liste plate de places boursières, la seconde une 
; liste contenant des matières premières, construire récursivement une liste comme suit (chaque bourse a toutes les matières) :

; liste_bourses : (bourse1 bourse2... bourseN) 
; liste_matières : (matière1 matière2... matièreN)

; => ((bourse1 (matière1) (matière2) ... (matièreN)) ... (bourse2 (matière1) (matière2)... (matièreN)))

; On appellera cette liste : Cours-bourses. Cette partie de l'exercice est très simple pour ceux qui ont révisé, 
; ce qui fait que c'est la suite qui compte vraiment.

(setq liste_bourses '(Frankfort Paris Londres Bejing))
(setq liste_matières '(blé soja café))

(defun construit-matières (matières)
  (cond
    ((atom matières) nil)
    (t (cons (cons (car matières) nil) (construit-matières (cdr matières)))) ) )

(defun construit-cours-bourse (bourses matières)
  (cond
    ((atom bourses) nil)
    (t (cons (cons (car bourses) (construit-matières matières)) (construit-cours-bourse (cdr bourses) matières))) ) )

(construit-matières liste_matières)
; => ((blé) (soja) (café))

(setq Cours-bourses (construit-cours-bourse liste_bourses liste_matières))
; ((Frankfort (blé) (soja) (café)) (Paris (blé) (soja) (café)) (Londres (blé) (soja) (café)) (Bejing (blé) (soja) (café)))

; Écrire une fonction avec comme argument Cours-bourses qui interroge l'utilisateur (avec un (read)) pour obtenir le prix de 
; chaque matière dans chaque place boursière et qui construit la liste suivante :

; => ((bourse1 (matière1 . prix) (matière2 . prix)... ) etc.

; La fonction parcourt toutes les places boursières et toutes les matières, et, pour chaque couple place boursière – matière première, 
; pose la question :

; "Quel est le prix de <blé par exemple> à <Frankfort par exemple> ? (écrivez un nombre)"

; Puis effectue un read de la réponse, vérifie que c'est bien un nombre, et insère (matière1 . prix) dans la nouvelle liste.

; Astuce : pour poser la question, il faut utiliser la fonction (print <message>) ; vous pouvez imprimer avec cinq fois la 
; fonction print (pour "Quel est le prix de", puis pour <matière première en cours>, puis pour "à", puis pour <place boursière en cours>, 
; puis pour " ? (écrivez un nombre)"), ou alors construire la chaîne avec string-concat et l'imprimer avec un seul print. 
; Faites un (terpri) à la fin pour aller à la ligne. Pour récupérer la réponse, il suffit de la fonction (read).

; Conseil : écrivez une sous-fonction juste pour imprimer la question et récupérer la réponse.

(defun demande-un-cours (matière bourse &aux prix)
  (print (string-concat "Quel est le prix de/du " (string matière) " à la bourse de " (string bourse) " ? (écrivez un nombre)"))
  (setq prix (read))
  (cond
    ((numberp prix) prix)
    (t
      (print "Ce n'est pas un nombre") 
      (demande-un-cours matière bourse)) ) )

(defun demande-les-cours (bourse matières)
  (cond
    ((atom matières) nil)
    (t 
      (cons 
        (cons (caar matières) (demande-un-cours (caar matières) bourse))
        (demande-les-cours bourse (cdr matières)) ) ) ) )

(defun demande-tous-les-cours (cours-bourses)
  (cond
    ((atom cours-bourses) nil)
    (t 
      (cons 
        (cons (caar cours-bourses) (demande-les-cours (caar cours-bourses) (cdar cours-bourses)))
        (demande-tous-les-cours (cdr cours-bourses)) ) ) ) )

(demande-un-cours 'blé 'Frankfurt)
; => "Quel est le prix de/du blé à la bourse de Frankfurt ? (écrivez un nombre)" 2.4
; => 2.4

(demande-les-cours 'Frankfurt '((blé) (soja) (café) (maïs)))
; => ((blé . 1.2) (soja . 1.3) (café . 1.4) (maïs . 1.5))

(demande-tous-les-cours Cours-bourses)
; => "Quel est le prix de/du blé à la bourse de Frankfort ? (écrivez un nombre)" 1.2
; => 
; => "Quel est le prix de/du soja à la bourse de Frankfort ? (écrivez un nombre)" 2.3
; => 
; => "Quel est le prix de/du café à la bourse de Frankfort ? (écrivez un nombre)" 3.4
; =>
; => "Quel est le prix de/du blé à la bourse de Paris ? (écrivez un nombre)" 4.5
; => 
; => "Quel est le prix de/du soja à la bourse de Paris ? (écrivez un nombre)" 5.6
; => 
; => "Quel est le prix de/du café à la bourse de Paris ? (écrivez un nombre)" 6.7
; => 
; => "Quel est le prix de/du blé à la bourse de Londres ? (écrivez un nombre)" 7.8
; => 
; => "Quel est le prix de/du soja à la bourse de Londres ? (écrivez un nombre)" 8.9
; => 
; => "Quel est le prix de/du café à la bourse de Londres ? (écrivez un nombre)" 9.0
; => 
; => "Quel est le prix de/du blé à la bourse de Bejing ? (écrivez un nombre)" 1.1
; => 
; => "Quel est le prix de/du soja à la bourse de Bejing ? (écrivez un nombre)" 1.2
; => 
; => "Quel est le prix de/du café à la bourse de Bejing ? (écrivez un nombre)" 1.3
; => ((Frankfort (blé . 1.2) (soja . 2.3) (café . 3.4)) (Paris (blé . 4.5) (soja . 5.6) (café . 6.7)) (Londres (blé . 7.8) (soja . 8.9) (café . 9.0)) (Bejing (blé . 1.1) (soja . 1.2) (café . 1.3)))


; Epreuve 2

; Écrire une variante de la fonction finale de l'épreuve 1, qui modifie Cours-bourses au lieu de construire une nouvelle liste.

(defun demande-les-cours (bourse matières)
  (cond
    ((atom matières) nil)
    (t
      (rplacd (car matières) (demande-un-cours (caar matières) bourse))
      (demande-les-cours bourse (cdr matières)) ) ) )

(defun demande-tous-les-cours (cours-bourses)
  (cond
    ((atom cours-bourses) nil)
    (t 
      (demande-les-cours (caar cours-bourses) (cdar cours-bourses))
      (demande-tous-les-cours (cdr cours-bourses)) ) ) )

(setq liste '((blé) (soja) (café) (maïs)))
; => ((blé) (soja) (café) (maïs))

(demande-les-cours 'Frankfurt liste)
; => "Quel est le prix de/du blé à la bourse de Frankfurt ? (écrivez un nombre)" 1.2
; => 
; => "Quel est le prix de/du soja à la bourse de Frankfurt ? (écrivez un nombre)" 2.3
; => 
; => "Quel est le prix de/du café à la bourse de Frankfurt ? (écrivez un nombre)" 3.4
; => 
; => "Quel est le prix de/du maïs à la bourse de Frankfurt ? (écrivez un nombre)" 4.5
; => nil

liste
; => ((blé . 1.2) (soja . 2.3) (café . 3.4) (maïs . 4.5))

(setq Cours-bourses (construit-cours-bourse liste_bourses liste_matières))
; => ((Frankfort (blé) (soja) (café)) (Paris (blé) (soja) (café)) (Londres (blé) (soja) (café)) (Bejing (blé) (soja) (café)))

(demande-tous-les-cours Cours-bourses)
; => "Quel est le prix de/du blé à la bourse de Frankfort ? (écrivez un nombre)" 1.1
; => 
; => "Quel est le prix de/du soja à la bourse de Frankfort ? (écrivez un nombre)" 1.2
; => 
; => "Quel est le prix de/du café à la bourse de Frankfort ? (écrivez un nombre)" 1.3
; => 
; => "Quel est le prix de/du blé à la bourse de Paris ? (écrivez un nombre)" 2.1
; => 
; => "Quel est le prix de/du soja à la bourse de Paris ? (écrivez un nombre)" 2.2
; => 
; => "Quel est le prix de/du café à la bourse de Paris ? (écrivez un nombre)" 2.3
; => 
; => "Quel est le prix de/du blé à la bourse de Londres ? (écrivez un nombre)" 3.1
; => 
; => "Quel est le prix de/du soja à la bourse de Londres ? (écrivez un nombre)" 3.2
; => 
; => "Quel est le prix de/du café à la bourse de Londres ? (écrivez un nombre)" 3.3
; => 
; => "Quel est le prix de/du blé à la bourse de Bejing ? (écrivez un nombre)" 4.1
; => 
; => "Quel est le prix de/du soja à la bourse de Bejing ? (écrivez un nombre)" 4.2
; => 
; => "Quel est le prix de/du café à la bourse de Bejing ? (écrivez un nombre)" 4.3
; => nil

Cours-bourses
; => ((Frankfort (blé . 1.1) (soja . 1.2) (café . 1.3)) (Paris (blé . 2.1) (soja . 2.2) (café . 2.3)) (Londres (blé . 3.1) (soja . 3.2) (café . 3.3)) (Bejing (blé . 4.1) (soja . 4.2) (café . 4.3)))
