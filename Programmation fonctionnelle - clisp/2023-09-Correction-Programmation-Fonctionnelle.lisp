; SEPTEMBRE 2023

; Epreuve 1

; Soient deux listes plates, la première étant une liste de magasins, la seconde une liste de prix pour un produit donné, 
; construire récursivement une liste comme suit (on suppose que les deux listes ont la même longueur) :
; liste_magasins : (magasin1 magasin2... magasinN) 
; produit : (prix1 prix2... prixN)
; => ((produit (magasin1 . prix1) ... (magasinN . prixN)) 
; On appellera cette liste : Prix-produit.

; Note: il y a une erreur dans l'énoncé. En effet, dans l'exemple donnée, il n'y a pas le même nombre de parenthèses ouvrantes et fermantes.
; On va supposer que la première parenthèse est en trop donc que l'on doit ontenir:
; => (produit (magasin1 . prix1) ... (magasinN . prixN))


(defun construit-magasins-prix (magasins prix)
  (cond
    ((atom magasins) nil)
    (t (cons (cons (car magasins) (car prix)) (construit-magasins-prix (cdr magasins) (cdr prix)))) ) )

(defun construit-prix-produit (magasins produit prix)
    (cons produit (construit-magasins-prix magasins prix)) )


(setq liste_magasins '(magasin1 magasin2 magasin3 magasin4))
(setq produit '(20 22 18 20))

(construit-magasins-prix liste_magasins produit)
; => ((magasin1 . 20) (magasin2 . 22) (magasin3 . 18) (magasin4 . 20))
(construit-prix-produit liste_magasins 'produit produit)
; => (produit (magasin1 . 20) (magasin2 . 22) (magasin3 . 18) (magasin4 . 20))

(setq Prix-produit (construit-prix-produit liste_magasins 'produit produit))
; => (produit (magasin1 . 20) (magasin2 . 22) (magasin3 . 18) (magasin4 . 20))

; À partir de la liste Prix-produit (pas de la liste produit), écrire une fonction qui calcule le prix moyen du produit dans tous les magasins

(defun somme (s prix-produit)
  (cond
    ((atom prix-produit) s)
    ((listp (car prix-produit)) 
      (somme 
        (cons (+ (car s) (cdar prix-produit)) (1+ (cdr s))) 
        (cdr prix-produit) ) )
    (t (somme s (cdr prix-produit))) ) )

(defun prix-moyen (prix-produit &aux s)
  (setq s (somme '(0 . 0) prix-produit))
  (/ (car s) (cdr s)) )

(prix-moyen Prix-produit)
; => 20

; et une autre qui ramène le nom du magasin qui a le prix le moins cher.

(defun minimum (m prix-produit)
  (cond
    ((atom prix-produit) m)
    ((< (cdar prix-produit) (cdr m)) 
      (minimum (cons (caar prix-produit) (cdar prix-produit)) (cdr prix-produit)) ) 
    (t (minimum m (cdr prix-produit))) ) )

(defun magasin-prix-minimum (prix-produit)
  (car (minimum (cadr prix-produit) (cddr prix-produit))) )

(magasin-prix-minimum Prix-produit)
; => magasin3

; Epreuve 2

; Écrire une fonction qui part de la liste Prix-produit et qui la modifie pour mettre les magasins dans l'ordre 
; croissant des prix du produit (le magasin le moins cher en premier).

(defun plus-petit (m prix-produit &aux tmp)
  (cond
    ((atom prix-produit) m)
    ((< (cdar prix-produit) (cdar m))
      (setq tmp (car m))
      (rplaca m (car prix-produit))
      (rplaca prix-produit tmp)
      (plus-petit m (cdr prix-produit)) )
    (t (plus-petit m (cdr prix-produit))) ) )

(defun trie (prix-produit)
  (cond
    ((atom prix-produit) nil)
    ((atom (car prix-produit)) (trie (cdr prix-produit)))
    (t
      (plus-petit prix-produit (cdr prix-produit))
      (trie (cdr prix-produit)) ) ) )

(trie Prix-produit)
; => nil

Prix-produit
; => (produit (magasin3 . 18) (magasin1 . 20) (magasin4 . 20) (magasin2 . 22))
