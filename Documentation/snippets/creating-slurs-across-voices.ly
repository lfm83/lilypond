%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.29"

\header {
  lsrtags = "expressive-marks, keyboards, unfretted-strings"

%% Translation of GIT committish: 0b55335aeca1de539bf1125b717e0c21bb6fa31b
  texidoces = "
En determinadas situaciones es necesario crear ligaduras de
expresión entre notas que están en voces distintas.

La solución es añadir notas invisibles a una de las voces
utilizando @code{\\hideNotes}.

Este ejemplo es el compás 235 de la Chacona de la segunda Partita
para violín solo, BWV 1004, de Bach.

"
  doctitlees = "Hacer ligaduras entre voces distintas"

  texidoc = "
In some situations, it may be necessary to create slurs between notes
from different voices.

The solution is to add invisible notes to one of the voices, using
@code{\\hideNotes}.

This example is measure 235 of the Ciaconna from Bach's 2nd Partita for
solo violin, BWV 1004.

"
  doctitle = "Creating slurs across voices"
} % begin verbatim

\relative c' {
  <<
    {
      d16( a') s a s a[ s a] s a[ s a]
    }
    \\
    {
      \slurUp
      bes,16[ s e](
      \hideNotes a)
      \unHideNotes f[(
      \hideNotes a)
      \unHideNotes fis](
      \hideNotes a)
      \unHideNotes g[(
      \hideNotes a)
      \unHideNotes gis](
      \hideNotes a)
    }
  >>
}

