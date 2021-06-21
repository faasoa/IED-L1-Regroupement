(setq Traductions '(anglais (mot1 (motA motB)) (mot2 (motC motD)) (mot3 (motE motA motD)) (mot4 (motF motB)) (mot5 (motG motH motC)) (mot6 (motI))))

; Epreuve1
; 1.1 Traductions d'un mot ........................................................
; Fonction qui ramène les traductions d'un mot
; (trad 'mot2 Traductions) => (motC motD)
(defun trad_mot (mot liste)
    (cond
        ((atom liste) nil)
        ((and
                (listp (car liste))
                (equal mot (caar liste)) )
            (cadar liste) )
        (t (traduction mot (cdr liste))) ) )

; 1.2 Toutes les traductions sans doublons ........................................
; Fonction qui retourne une liste plate de toutes les traductions 
; (récup Traductions) => (motA motB motC motD motE motA motD motF motB motG motH motC motI)
(defun récup_traductions (liste)
    (cond
        ((atom liste) nil)
        ((not(listp (car liste)))
            (récup (cdr liste)) )
            
        (t
            (append
                (cadar liste)
                (récup (cdr liste)) ) ) ) )

; Fonction qui supprime les doublons d'une liste plates
; (doublon '(motA motB motC motA motE motB)) => (motC motA motE motB)
(defun doublon (liste)
    (cond
        ((atom liste) nil)
        ((member (car liste) (cdr liste))
            (doublon (cdr liste)) )
        (t (cons (car liste) (doublon (cdr liste))) ) ) )

; Fonction qui récupère tous les mots en anglais de Traductions en supprimant les doublons
; (doublon '(motA motB motC motA motE motB)) => (motC motA motE motB)
(defun récup_trad_doublon (liste)
    (cond
        ((atom liste) nil)
        (t (doublon (récup liste))) ) )

;Epreuve 2
; Fonction chirurgicale récursive qui remplace les traductions d'un mot par une seul traduction
; (modif_dictionnaire Traductions)) => (anglais (mot1 . motA) ... (motN . motX))
(defun modif_dictionnaire (liste)
    (cond
        ((atom liste) nil)
        ((listp (car liste))
            (rplacd (car liste) (caadar liste))
            (modif_dictionnaire (cdr liste)) ) 
        (t (modif_dictionnaire (cdr liste))) ) )

