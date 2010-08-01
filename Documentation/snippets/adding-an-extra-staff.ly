%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.29"

\header {
  lsrtags = "staff-notation, contexts-and-engravers"

%% Translation of GIT committish: 0b55335aeca1de539bf1125b717e0c21bb6fa31b
  texidoces = "
Se puede añadir (posiblemente de forma temporal) un pentagrama
nuevo una vez que la pieza ha comenzado.

"
  doctitlees = "Añadir un pentagrama nuevo"

  texidoc = "
An extra staff can be added (possibly temporarily) after the start of a
piece.

"
  doctitle = "Adding an extra staff"
} % begin verbatim

\score {
  <<
    \new Staff \relative c'' { c1 | c | c | c | c }
    \new StaffGroup \relative c'' {
      \new Staff {
        c1 | c <<
          c1
          \new Staff {
            \once \override Staff.TimeSignature #'stencil = ##f
            c1
          }
        >>
        c1
      }
    }
  >>
}

