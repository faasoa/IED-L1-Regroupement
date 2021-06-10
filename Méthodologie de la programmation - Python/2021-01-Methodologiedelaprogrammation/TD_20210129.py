#!/usr/bin/env python3
# coding: utf-8

# Nom         :
# Prénom      :
# N. étudiant :


# 1. Lecture d'une séquence
#
# Nous pouvons stocker une séquence d'ADN dans un fichier simplement à l'aide d'une chaine de caractères de cette forme:
# ```
# 'AATGTCCAGTCAGTTG...'
# ```
#
# Ecrire une fonction `lire_adn(filename)` permettant de lire et retourner le contenu d'un tel fichier.
#
# Par exemple, `lire_adn("ncov-s.txt")` retournera la séquence `"ATGTTTGTTTTTCTT..."`.


def lire_adn(filename):
    # votre code ici


# 2. Transcription
#
# La _transcription_ est un mécanisme qui permet de copier l'ADN dans le noyau de la cellule pour former un ARN.
# Lors de la transcription, la Thymine (T) est remplacée par l'Uracile (U).
#
# Ecrire une fonction `transcrire_adn(seq)` permettant de transcrire une séquence d'ADN en ARN.
#
# Par exemple, `transcrire_adn('AATGTCCAGTCAG')` doit renvoyer `'AAUGUCCAGUCAG'`.


def transcrire_adn(seq):
    # votre code ici


# 3. Découpage de l'ARN
#
# L'ARN est découpé en _codons_, constitués de 3 bases, qui correspondent chacun à un acide aminé. Les codons sont lus les uns à la suite des autres.
#
# Ecrire une fonction `arn_vers_codons(seq)` permettant de découper une séquence d'ADN en une liste de codons.
#
# Par exemple, `arn_vers_codons('AAUGUCCAGUCAGUU')` renverra: `['AAU', 'GUC', 'CAG', 'UCA', 'GUU']`


def arn_vers_codons(seq):
    # votre code ici


# 4. Traduction
#
# La _traduction_ de l'ADN consiste à lire l'ARN issu de la transcription pour synthétiser une protéine comme une chaîne d'acides aminés.
#
# Le dictionnaire ci-dessous donne la correspondance entre un codon, composé de trois bases d'ARN, et un acide aminé.
# Par exemple, `GUC` est un codon qui code pour l'acide aminé "Val" (valine).


codage = {'GUC': 'Val', 'GUG': 'Val', 'UCA': 'Ser', 'CUC': 'Leu', 'AUU': 'Ile', 'CCU': 'Pro', 'CGG': 'Arg',
          'GGU': 'Gly', 'CAU': 'His', 'CGU': 'Arg', 'GCG': 'Ala', 'AGA': 'Arg', 'CUG': 'Leu', 'GUU': 'Val',
          'AUA': 'Ile', 'UGU': 'Cys', 'GCC': 'Ala', 'UAU': 'Tyr', 'ACU': 'Thr', 'UGG': 'Trp', 'CAG': 'Gln',
          'CAC': 'His', 'AGC': 'Ser', 'GGG': 'Gly', 'CUU': 'Leu', 'ACA': 'Thr', 'CUA': 'Leu', 'GAA': 'Glu',
          'AUC': 'Ile', 'CGC': 'Arg', 'UGC': 'Cys', 'UCC': 'Ser', 'AAU': 'Asn', 'UUC': 'Phe', 'CCC': 'Pro',
          'AGG': 'Arg', 'UGA':  None, 'UAG':  None, 'UAA':  None, 'AUG': 'Met', 'UUG': 'Leu', 'UUA': 'Leu',
          'AGU': 'Ser', 'GGC': 'Gly', 'GAU': 'Asp', 'CCA': 'Pro', 'CGA': 'Arg', 'GUA': 'Val', 'CAA': 'Gln',
          'UCU': 'Ser', 'UCG': 'Ser', 'ACC': 'Thr', 'GAG': 'Glu', 'GGA': 'Gly', 'GCU': 'Ala', 'GAC': 'Asp',
          'AAC': 'Asn', 'AAG': 'Lys', 'GCA': 'Ala', 'CCG': 'Pro', 'AAA': 'Lys', 'ACG': 'Thr', 'UAC': 'Tyr',
          'UUU': 'Phe'}


# On remarquera que plusieurs codons différents peuvent coder pour le même acide aminé.
# Notez également que certains codent pour la valeur `None`.
# Ces derniers indiquent la fin de la partie "codante" et _stoppent_ la synthèse de la protéine.
#
# Écrire une fonction `traduire_arn(seq)` qui traduit l'ARN et renvoie la liste d'acides aminés correspondante.
# _Attention_, la chaine doit s'arrêter au codon STOP.
#
# Par exemple, `traduire_arn('AAUGUCCAGUAGUCA')` retournera `['Asn', 'Val', 'Gln']`.


def traduire_arn(seq):
    # votre code ici


# 5. Acide aminés
#
# On souhaite avoir un tableau permettant de savoir quels sont les codons qui correspondent à chaque acide aminé, sous cette forme:
#
# ```
# Ala : GCA, GCC, GCG, GCU
# Arg : AGA, AGG, CGA, CGC, CGG, CGU
# Asn : AAC, AAU
# ...
# ```
#
# Ecrire le code permettant de générer ce tableau, et l'enregistrer dans un fichier `amines.txt`.
# Ce fichier sera rendu avec le devoir.


# votre code ici

