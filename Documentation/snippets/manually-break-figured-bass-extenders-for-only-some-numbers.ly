%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.0"

\header {
  lsrtags = "chords"

  texidoc = "
Figured bass often uses extenders to indicate continuation of the
corresponding step. However, in this case lilypond is in greedy-mode
and uses extenders whenever possible. To break individual extenders,
one can simply use a modifier \\! to a number, which breaks any
extender attributed to that number right before the number.

"
  doctitle = "Manually break figured bass extenders for only some numbers"
} % begin verbatim

bassfigures = \figuremode {
  \set useBassFigureExtenders = ##t
  <6 4>4 <6 4\!> <6 4\!> <6 4\!> |  <6\! 4\!>  <6 4> <6 4\!> <6 4>
}

<<
  \new Staff \relative c'' { c1 c1 }
  \new FiguredBass \bassfigures
>>



