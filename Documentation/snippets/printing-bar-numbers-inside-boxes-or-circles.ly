%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.31"

\header {
  lsrtags = "rhythms, tweaks-and-overrides"

%% Translation of GIT committish: 0b55335aeca1de539bf1125b717e0c21bb6fa31b
  texidoces = "

Los números de compás también se pueden imprimir dentro de rectángulos o de circunferencias.

"
  doctitlees = "Imprimir números de compás dentro de rectángulos o circunferencias"



%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Taktnummern können auch in Boxen oder Kreisen gesetzt werden.

"
  doctitlede = "Setzen von Taktnummern in Kästen oder Kreisen"



%% Translation of GIT committish: 374d57cf9b68ddf32a95409ce08ba75816900f6b
  texidocfr = "
Les numéros de mesures peuvent être encadrés ou entourés d'un cercle.

"
  doctitlefr = "Inscrire le numéro de mesure dans un cadre ou un cercle"

  texidoc = "
Bar numbers can also be printed inside boxes or circles.

"
  doctitle = "Printing bar numbers inside boxes or circles"
} % begin verbatim

\relative c' {
  % Prevent bar numbers at the end of a line and permit them elsewhere
  \override Score.BarNumber #'break-visibility = #end-of-line-invisible
  \set Score.barNumberVisibility = #(every-nth-bar-number-visible 4)

  % Increase the size of the bar number by 2
  \override Score.BarNumber #'font-size = #2

  % Draw a box round the following bar number(s)
  \override Score.BarNumber #'stencil
    = #(make-stencil-boxer 0.1 0.25 ly:text-interface::print)
  \repeat unfold 5 { c1 }

  % Draw a circle round the following bar number(s)
  \override Score.BarNumber #'stencil
    = #(make-stencil-circler 0.1 0.25 ly:text-interface::print)
  \repeat unfold 4 { c1 } \bar "|."
}

