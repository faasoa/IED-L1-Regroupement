
Nom: 
Prénom: 
Numéro étudiant: 

; 1.1

; À partir d'une liste associant des noms de ville, un nombre de gens à 
; vacciner et un nombre de vaccins disponibles :
; 
; villes => ((ville1 population vaccins) (villeN population vaccins) ... (villeN population vaccins))
; 
; Faire une fonction qui construit une liste des villes ayant un nombre de 
; vaccins inférieur à sa population ou ayant un nombre supérieur, en fonction 
; d'un argument :
; 
; (vaccins villes 'insuffisant) => ramène la liste des villes n'ayant pas assez de vaccins.
; (vaccins villes 'suffisant) => ramène la liste des villes ayant assez ou trop de vaccins

(defun vaccins (liste condition)
  (cond
    ((atom liste) nil)
    ((or 
        (and (eq condition 'suffisant) (>= (caddar liste) (cadar liste)))
        (and (eq condition 'insuffisant) (< (caddar liste) (cadar liste))) )
      (cons (caar liste) (vaccins (cdr liste) condition)) )
    (t (vaccins (cdr liste) condition)) ) )

; Tests

(setq villes '((ville1 1000 100) (ville2 2000 2000) (ville3 3000 30000) (ville4 4000 400)))
(vaccins villes 'insuffisant) ; => (ville1 ville4)
(vaccins villes 'suffisant) ; => (ville2 ville3)

; 1.2

; Faire une fonction qui calcule le nombre total de vaccins disponibles dans 
; l'ensemble des villes

(defun total-vaccins (liste)
  (cond
    ((atom liste) 0)
    (t (+ (caddar liste) (total-vaccins (cdr liste)))) ) )

; Tests

(setq villes '((ville1 1000 100) (ville2 2000 2000) (ville3 3000 30000) (ville4 4000 400)))
(total-vaccins villes) ; => 32500

; 2

; A partir d'un arbre (liste quelconque), supprimer les branches contenant 
; (au premier niveau) l'atome nil, à l'aide d'une fonction chirurgicale récursive.

; Ex. (a (b c) nil d) est une branche qui contient l'atome nil ;
; mais (a (b c) (nil) d) est une branche qui ne contient pas, au premier niveau, 
; l'atome nil. On va donc supprimer la première branche, mais dans la deuxième, 
; on supprimera la sous-branche (nil).
;
; Astuce 1 : Utilisez une fonction auxiliaire qui teste si une branche contient 
; l'atome nil. 
; 
; Astuce 2 : Commencez par écrire une fonction non chirurgicale (qui construit 
; sans modifier).

; Détecte si une branche (liste) contient nil au premier niveau
(defun contient-nil (liste)
  (cond
    ((atom liste) nil)
    ((eq (car liste) nil) t)
    (t (contient-nil (cdr liste))) ) )

; Tests

(contient-nil '(a (b c) nil d)) ; => t
(contient-nil '(a (b c) e d)) ; nil
(contient-nil '(a (b c) (nil) d)) ; => nil
(contient-nil '(nil)) ; => t
(contient-nil '(b c)) ; => nil

; Fonction récursive qui contruit un arbre sans branche contenant nil 
; au premier niveau
(defun construire (arbre)
  (cond
    ((atom arbre) nil)
    ((contient-nil arbre) nil)
    ((listp (car arbre))
      (cons (construire (car arbre)) (construire (cdr arbre))) )
    (t (cons (car arbre) (construire (cdr arbre)))) ) )

; Note: La difficulté içi est de traiter contient-nil **avant** de traiter le
; cas des listes imbriquées (listp). En effet, nil = () et est donc aussi une
; liste.

; Tests

(setq arbre '(a (b c) nil d))
(construire arbre) ; => nil

(setq arbre '(a (b c) (nil) d))
(construire arbre) ; = (a (b c) nil d)

; Fonction auxiliaire qui modifie (chirurgicalement) une arbre pour enlever les
; branches contenant nil au premier niveau
(defun modifier-aux (arbre)
  (cond
    ((atom arbre) nil)
    ((contient-nil arbre) nil)
    ((listp (car arbre))
      (rplaca arbre (modifier-aux (car arbre)))
      (rplacd arbre (modifier-aux (cdr arbre))) ) 
    (t (cons (car arbre) (modifier-aux (cdr arbre)))) ) )

; Macro permettant de modifier l'argument si celui-ci doit être remplacé par nil
; (voir le premier exemple)
(defmacro modifier (arbre)
  (list 'setq arbre (list 'modifier-aux arbre)))

; Tests

(setq arbre '(a (b c) nil d))
(modifier arbre)
arbre ; => nil (d'où l'utilisation de la macro)

(setq arbre '(a (b c) (nil) d))
(modifier arbre)
arbre ; => (a (b c) nil d)
