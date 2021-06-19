; Listes de base
(setq ListeA '((ET Spielberg) (Django Tarantino) (Avatar Cameron) (Duel Spielberg)))
(setq ListeB '(1500000 6000000 10000000 500000))

; Epreuve 1
; 1. Fonction récursive qui associe le budget à un film
(defun associe (l1 l2)
    (cond
        ((or (atom l1) (atom l2)) nil)
        (
            (cons
                (list
                    (caar l1)
                    (cadar l1)
                    (car l2) )
                (associe (cdr l1) (cdr l2)) ) ) ) )

; 2 Fonction récursive qui calcule le budget moyen de la ListeB
(defun budget_moyen (liste)
    (defun t_budget (liste)
        (cond
            ((atom liste) 0)
            (t (+ (car liste) (t_budget (cdr liste)))) ) )
    (defun n_budget (liste)
        (cond
            ((atom liste) 0)
            (t (+ 1 (n_budget (cdr liste)))) ) )
    (cond
        ((atom liste)0)
        (t (/ (t_budget liste) (n_budget liste))) ) )

; Epreuve 2
; Liste des retours des fonctions précédentes pour la fonction grand_budget
(setq ListeC (associe ListeA ListeB))
(setq b_moyen (budget_moyen ListeB))

; Fonction chirurgical récursive qui modifie la ListeC
; pour ne garder que les films dont le budget est supérieur au budget moyen
(defun grand_budget (budget liste)
    (cond
        ((atom liste) nil)
        ((> (caddar liste) budget)
            (rplacd liste (grand_budget budget (cdr liste))) )
        ((grand_budget budget (cdr liste))) ) )
