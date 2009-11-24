%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.4"

\header {
  lsrtags = "text"

%% Translation of GIT committish: b2d4318d6c53df8469dfa4da09b27c15a374d0ca
  texidoces = "
Aunque normalmente las marcas de texto sólo se imprimen sobre el
pentagrama superior, también se pueden imprimir en otro pentagrama
cualquiera.

"
  doctitlees = "Imprimir marcas en cualquier pentagrama"

%% Translation of GIT committish: d96023d8792c8af202c7cb8508010c0d3648899d
  texidocde = "
Normalerweise werden Textzeichen nur über dem obersten Notensystem gesetzt.  Sie
können aber auch über jedem System ausgegeben werden.

"
  doctitlede = "Zeichen über jedem System ausgeben"
%% Translation of GIT committish: c2e8b1d6d671dbfc138f890cbc7e9882b7be2761
  texidocfr = "
Bien que ces indications textuelles ne soient habituellement imprimées
qu'au niveau de la portée supérieure, vous pouvez forcer leur
affectation à chacune des portées.

"
  doctitlefr = "Impression des indications sur toutes les portées d'un système"


  texidoc = "
Although text marks are normally only printed above the topmost staff,
they may also be printed on every staff.

"
  doctitle = "Printing marks on every staff"
} % begin verbatim

\score {
  <<
    \new Staff { c''1 \mark "molto" c'' }
    \new Staff { c'1 \mark "molto" c' }
  >>
  \layout {
    \context {
      \Score
      \remove "Mark_engraver"
      \remove "Staff_collecting_engraver"
    }
    \context {
      \Staff
      \consists "Mark_engraver"
      \consists "Staff_collecting_engraver"
    }
  }
}

