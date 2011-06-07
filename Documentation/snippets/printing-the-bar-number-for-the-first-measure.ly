%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.0"

\header {
  lsrtags = "rhythms"

%% Translation of GIT committish: 59caa3adce63114ca7972d18f95d4aadc528ec3d
  texidoces = "

De forma predeterminada se suprime el número del primer compás de una
partitura si es menor o igual a @q{1}.  Al establecer el valor de
@code{barNumberVisibility} a @code{all-bar-numbers-visible}, se puede
imprimir cualquier número de compás para el primer compás y todos los
siguientes.  Observe que, para que esto funcione, se debe insertar una
líinea divisoria vacía antes de la primera nota.

"

  doctitlees = "Imprimir el número de compás en el primer compás"



%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Standardmäßig wird die erste Taktzahl einer Partitur nicht gesetzt,
wenn sie weniger oder gleich '1' ist.  Indem man @code{barNumberVisibility}
auf @code{all-bar-numbers-visible} setzt, kann eine beliebige
Taktzahl für den ersten und die folgenden Takte gesetzt werden.
Eine leere Taktlinie muss jedoch vor der ersten Note eingefügt
werden, damit das funktioniert.

"
  doctitlede = "Setzen der Taktnummer für den ersten Takt"



%% Translation of GIT committish: 374d57cf9b68ddf32a95409ce08ba75816900f6b
  texidocfr = "
Par défaut, LilyPond n'affiche pas le premier numéro de mesure s'il est
inférieur à 2. Le fait de définir @code{barNumberVisibility} à
@code{all-bar-numbers-visible} vous permettra d'imprimer n'importe quel
numéro pour la première mesure.  À noter que l'impression d'un numéro
de mesure ne peut intervenir que s'il y a une barre.  Aussi, pour
pouvoir le faire au début d'un morceau, devrez-vous ajouter une barre
vide avant la première note.

"
  doctitlefr = "Afficher le numéro de la première mesure"

  texidoc = "
By default, the first bar number in a score is suppressed if it is less
than or equal to `1'.  By setting @code{barNumberVisibility} to
@code{all-bar-numbers-visible}, any bar number can be printed for the
first measure and all subsequent measures.  Note that an empty bar line
must be inserted before the first note for this to work.

"
  doctitle = "Printing the bar number for the first measure"
} % begin verbatim

\relative c' {
  \set Score.barNumberVisibility = #all-bar-numbers-visible
  \bar ""
  c1 | d | e | f \break
  g1 | e | d | c
}

