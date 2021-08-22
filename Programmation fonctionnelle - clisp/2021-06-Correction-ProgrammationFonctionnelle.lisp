; Robin Clerc 20013576

; Epreuve 1
; Soient deux listes plates, la première étant une liste de produits et la seconde une liste de prix, ayantle même nombre d'éléments.
; 1. Construire récursivement une liste dont chaque élément est un doublet ; le premier élément de ce doublet est le produit et le deuxième le prix.
; (produit produit ... produit) (prix prix ... prix)
; => ((produit . prix) (produit . prix) ... (produit . prix))

; Les listes :
(setq Liste_produits '(produit produit produit produit))
(setq Liste_prix '(prix prix prix prix))

; Fonction récursive pour construire la liste voulue  :
(defun associer (L1 L2)
  (cond
    ((atom L1) nil)
    ((atom L2) nil)
    (t
      (cons
        (cons (car L1) (car L2))
        (associer (cdr L1) (cdr L2)) ) ) ) )


; 2. Écrire une fonction qui ramène le prix d'un produit à partir de cette dernière liste :
; (prix produit liste) => prix du produit

(defun prix (produit L)
  (cond
    ((atom L) nil)
    ((equal produit (caar L)) (return-from prix (cdar L)))
    (t (prix produit (cdr L))) ) )

; Une liste pour tester la fonction ci-dessus
(setq test '((produit1 . 1)(produit2 . 2)(produit3 . 3)))

; Epreuve 2
; A partir d'un arbre (liste quelconque), supprimer les noeuds dont la valeur n'est pas un nombre, à l'aide d'une fonction chirurgicale récursive.
; Astuce 1 : Pour savoir si un élément est un nombre, utilisez la fonction numberp (qui ramène nil si son argument n'est pas un nombre).
; Astuce 2 : Commencez par écrire une fonction non chirurgicale (qui construit sans modifier).

; Un arbre avec des nombres et autres :
(setq arbre '((a b c) (1 2 3) (a b (c (d))) (1 2 (3 (4))) (a 2 (c (4)))))

; Fonction non chirurgicale (cons)
(defun F (L)
  (cond
    ((atom L) nil)
    ((listp (car L)) (cons (F (car L)) (F (cdr L))) )
    ((numberp (car L)) (cons (car L) (F (cdr L))))
    (t (F (cdr L))) ) )

; Fonction chirurgicale (rplacd et rplaca)
(defun garde_nb (L)
  (cond
    ((atom L) nil)
    ((listp (car L))
      (rplaca L (garde_nb (car L)))
      (rplacd L (garde_nb (cdr L))) )
    ((numberp (car L)) (rplacd  L (garde_nb (cdr L))))
    (t (garde_nb (cdr L))) ) )
