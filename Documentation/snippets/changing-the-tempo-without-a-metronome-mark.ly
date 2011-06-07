%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.0"

\header {
  lsrtags = "rhythms, tweaks-and-overrides, midi"

%% Translation of GIT committish: 59caa3adce63114ca7972d18f95d4aadc528ec3d
  texidoces = "
Para cambiar el tempo en la salida MIDI sin
imprimir nada, hacemos invisible la indicación metronómica:

"

  doctitlees = "Cambiar el tempo sin indicación metronómica"


%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Um das Tempo für die MIDI-Ausgabe zu ändern, ohne eine Tempoangabe in den
Noten auszugeben, kann die Metronombezeichnung unsichtbar gemacht werden:

"

  doctitlede = "Das Tempo ohne Metronom-Angabe verändern"

%% Translation of GIT committish: 4ab2514496ac3d88a9f3121a76f890c97cedcf4e
  texidocfr = "
Vous pouvez indiquer un changement de tempo pour le fichier MIDI sans
pour autant l'imprimer.  Il suffit alors de le rendre invisible aux
interprètes.

"
  doctitlefr = "Changement de tempo sans indication sur la partition"


  texidoc = "
To change the tempo in MIDI output without printing anything, make the
metronome mark invisible.

"
  doctitle = "Changing the tempo without a metronome mark"
} % begin verbatim

\score {
  \new Staff \relative c' {
    \tempo 4 = 160
    c4 e g b
    c4 b d c
    \set Score.tempoHideNote = ##t
    \tempo 4 = 96
    d,4 fis a cis
    d4 cis e d
  }
  \layout { }
  \midi { }
}
