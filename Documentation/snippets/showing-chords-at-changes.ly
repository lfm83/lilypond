%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.0"

\header {
  lsrtags = "chords"

%% Translation of GIT committish: 59caa3adce63114ca7972d18f95d4aadc528ec3d
  texidoces = "
Se pueden imprimir los acordes exclusivamente al comienzo de las
líneas y cuando cambia el acorde.

"
  doctitlees = "Imprimir los acordes cuando se produce un cambio"


%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Akkordsymbole können so eingestellt werden, dass sie nur zu Beginn der Zeile
und bei Akkordwechseln angezeigt werden.

"
  doctitlede = "Akkordsymbole bei Wechsel anzeigen"

  texidoc = "
Chord names can be displayed only at the start of lines and when the
chord changes.

"
  doctitle = "Showing chords at changes"
} % begin verbatim

harmonies = \chordmode {
  c1:m c:m \break c:m c:m d
}
<<
  \new ChordNames {
    \set chordChanges = ##t
    \harmonies
  }
  \new Staff {
    \relative c' { \harmonies }
  }
>>

