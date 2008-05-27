%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.46"

\header {
  lsrtags = "rhythms, tweaks-and-overrides"

  texidoc = "
Beam positions may be controlled manually, by overriding the
@code{positions} setting of the @code{Beam} grob.




"
  doctitle = "Manually controlling beam positions"
} % begin verbatim
\relative c' {
  \time 2/4
  % from upper staffline (position 4) to center (position 0)
  \override Beam #'positions = #'(2 . 0)
  c8 c
  % from center to one above center (position 2)
  \override Beam #'positions = #'(0 . 1)
  c8 c
}

