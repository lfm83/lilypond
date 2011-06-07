% DO NOT EDIT this file manually; it is automatically
% generated from Documentation/snippets/new
% Make any changes in Documentation/snippets/new/
% and then run scripts/auxiliar/makelsr.py
%
% This file is in the public domain.
%% Note: this file works from version 2.13.36
\version "2.14.0"

\header {
%% Translation of GIT committish: 59caa3adce63114ca7972d18f95d4aadc528ec3d

  texidoces = "
Funciones postfijas para la creación de objetos de extensión de texto
personalizados.  Los objetos de extensión deben comenzar en la primera
nota del compás.  Hay que utilizar -\mycresc, en caso contrario el
comienzo del eobjeto de extensión se asignará a la nota siguiente.

"

  doctitlees = "Objeto personalizado de extensión de texto de matices dinámicos postfijo"

%%   Translation of GIT committish: ab9e3136d78bfaf15cc6d77ed1975d252c3fe506


  texidocde = "Die Nachstellung funktioniert für eigene Crescendo-Textstrecker.
Die Strecker sollten an der ersten Note eines Taktes beginnen.  Man muss
-\mycresc benutzen, sonst wird der Beginn des Streckers der nächsten Note
zugewiesen.

"
  doctitlede = "Eigene Dynamiktextspanner nachgestellt"


%% Translation of GIT committish: a06cb0b0d9593ba110e001f2b0f44b8bef084693

  texidocfr = "
Il s'agit de fonctions postfix pour personnaliser l'extension des
crescendos textuels.  L'extension devrait débuter sur la première notte
de la mesure.  Il faut utiliser @code{-\mycresc} -- comme une
articulation -- sous peine que le départ de l'extension n'apparaisse
qu'à la note suivante.
"

  doctitlefr = "Personnalisation des extenseurs de nuance postfix"


  lsrtags = "expressive-marks, tweaks-and-overrides"
  texidoc = "Postfix functions for custom crescendo text spanners.  The spanners
should start on the first note of the measure.  One has to use -\mycresc,
otherwise the spanner start will rather be assigned to the next note.
"
  doctitle = "Dynamics custom text spanner postfix"
} % begin verbatim


% Two functions for (de)crescendo spanners where you can explicitly give the
% spanner text.
mycresc =
#(define-music-function (parser location mymarkup) (markup?)
   (make-music 'CrescendoEvent
               'span-direction START
               'span-type 'text
               'span-text mymarkup))
mydecresc =
#(define-music-function (parser location mymarkup) (markup?)
   (make-music 'DecrescendoEvent
               'span-direction START
               'span-type 'text
               'span-text mymarkup))

\relative c' {
  c4-\mycresc "custom cresc" c4 c4 c4 |
  c4 c4 c4 c4 |
  c4-\mydecresc "custom decresc" c4 c4 c4 |
  c4 c4\! c4 c4
}



