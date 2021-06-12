; liste de base
(setq 
  etudiants
  '((etudiant1 (cours1 . 20) (cours2 . 18) (cours3 . 17))
  (etudiant2 (cours1 . 2) (cours2 . 8))
  (etudiant3 (cours1 . 10) (cours2 . 15) (cours3 . 17)) ) )
     
;fonction  de création de liste d'étudiants
(defun recurEtud(liste)
  (cond
    ((atom liste) nil)
    ((cons
        (car (car liste))
        (recurEtud (cdr liste)) ) ) ) )
        
; Ex 1.1 .....................................................................................................
; fonction de sélection d'un étudiant dans la liste
(defun findEtud (etudiant liste)
  (cond
    ((atom liste) nil)
    ((equal etudiant (caar liste)) (car liste))
    ((findEtud etudiant (cdr liste))) ) )
    
    
; Ex 1.2......................................................................................................
        
; fonction de création récursive d'une liste de cours d'un étudiant
        
(defun recursCours (listeCours)
  (cond
    ((atom listeCours) nil)
    ((cons
        (caar listeCours)
        (recursCours (cdr listeCours)) ) ) ) )
        
; fonction de création de la liste de cours d'un étudiant
(defun coursEtud (etudiant liste)
  (recursCours (cdr (findEtud etudiant liste))) )
  
; Ex 1.3....................................................................................................
  
; fonction de création récursive d'une liste de notes d'un étudiant 
  
(defun recursNote (listeCours)
  (cond
    ((atom listeCours) nil)
    ((cons
        (cdar listeCours)
        (recursNote (cdr listeCours)) ) ) ) )
        
;fonction calculant une moyenne
        
(defun moy(listeNotes  &optional (moyenne 0) (cpteur 0))
  (cond
    ((atom listeNotes) (/ moyenne cpteur))
    ((moy (cdr listeNotes) (+ moyenne (car listeNotes)) (+ cpteur 1))) ) )



; calcul d'une moyenne d'un étudiant
(defun moyenneEtud (etudiant listeEtud)
  (moy
    (recursNote (cdr (findEtud etudiant listeEtud))) ) )
    
; Ex 1.4............................................................................................................
    
; fonction de création récursive de la liste de notes d'un cours donné
	
(defun listeNoteCours (cours listeEtud)
  (cond
    ((atom listeEtud) nil)
    ((cons
        (Notecours cours (cdar listeEtud))
        (listeNoteCours cours (cdr listeEtud)) ) ) ) )
        
; fonction de sélection de la note d'un cours pour un étudiant donné
        
(defun Notecours (cours listeCours)
  (cond
    ((atom listeCours) nil)
    ((equal cours (caar listeCours)) (cdar listeCours))
    ((Notecours cours (cdr listeCours))) ) )
    
; fonction principale de calcul de moyenne
    
(defun MoyenneCours (cours listeEtud)
  (moy (listeNoteCours (cours listeEtud))) )
  
  
  
; Ex 2.1 ..............................................................................................................
  
(defun modifEtud (listeEtud)
  (cond
    ((atom listeEtud) nil)
    (t 
      (rplacd (car listeEtud) (moyenneEtud (caar listeEtud) listeEtud)) 
      (modifEtud (cdr listeEtud)) ) ) )
    
    
