%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.0"

\header {
  lsrtags = "ancient-notation"

%% Translation of GIT committish: 59caa3adce63114ca7972d18f95d4aadc528ec3d
  texidoces = "
Las indicaciones de compás también se pueden grabar en estilo antiguo.

"
  doctitlees = "Indicaciones de compás antiguas"

  texidoc = "
Time signatures may also be engraved in an old style.



"
  doctitle = "Ancient time signatures"
} % begin verbatim

{
  \override Staff.TimeSignature #'style = #'neomensural
  s1
}

