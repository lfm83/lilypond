%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.31"

\header {
  lsrtags = "vocal-music"

  texidoc = "
Fonts can be changed independently for each stanza, including the font
used for printing the stanza number.

"
  doctitle = "Changing stanza fonts"
} % begin verbatim

\new Voice {
  \time 3/4
  g2 e4
  a2 f4
  g2.
}
\addlyrics {
  \set stanza = #"1. "
  Hi, my name is Bert.
}
\addlyrics {
  \override StanzaNumber #'font-name = #"DejaVu"
  \set stanza = #"2. "
  \override LyricText #'font-family = #'typewriter
  Oh, ché -- ri, je t'aime
}

