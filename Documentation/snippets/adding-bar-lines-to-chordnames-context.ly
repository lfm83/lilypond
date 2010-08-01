%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.29"

\header {
  lsrtags = "chords"

%% Translation of GIT committish: 0b55335aeca1de539bf1125b717e0c21bb6fa31b
  texidoces = "
Para añadir indicaciones de línea divisoria dentro del contexto de
los nombres de acorde @code{ChordNames}, incluya el grabador
@code{Bar_engraver}.

"
  doctitlees = "Añadir barras de compás al contexto de nombres de acorde (ChordNames)"

%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Um Taktstriche in einem @code{ChordNames}-Kontext anzeigen zu lassen, muss der
@code{Bar_engraver} hinzugefügt werden.

"
  doctitlede = "Tatkstriche in einen ChordNames-Kontext hinzufügen"

  texidoc = "
To add bar line indications in the @code{ChordNames} context, add the
@code{Bar_engraver}.

"
  doctitle = "Adding bar lines to ChordNames context"
} % begin verbatim

\new ChordNames \with {
  \override BarLine #'bar-size = #4
  \consists "Bar_engraver"
}
\chordmode {
  f1:maj7 f:7 bes:7
}


