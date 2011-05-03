% DO NOT EDIT this file manually; it is automatically
% generated from Documentation/snippets/new
% Make any changes in Documentation/snippets/new/
% and then run scripts/auxiliar/makelsr.py
%
% This file is in the public domain.
%% Note: this file works from version 2.13.36
\version "2.13.36"
\header {

  texidocde = "Dieses Schnipsel zeigt, wie man die alternative Brevis mit zwei
vertikalen Linien an jeder Seite des Notenkopfes benutzt."
  doctitlede = "Alternative Brevis mit zwei vertiaklen Linien"


  lsrtags = "rhythms,expressive-marks"
  texidoc = "This code demonstrates how to use the alternative breve note
with two vertical lines on each side of the notehead instead of one line."
  doctitle = "Alternative breve notehead with double vertical lines"
} % begin verbatim


\relative c'' {
  \time 4/2
  \override Staff.NoteHead #'style = #'altdefault
  c\breve | b\breve
}
