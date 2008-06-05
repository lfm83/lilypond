%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.48"

\header {
  lsrtags = "expressive-marks"

  texidoc = "
When two or more glissandi intersect with each other, a warning
message, \"warning: ignoring too many clashing note columns\" will
appear when compiling the LilyPond file.  Here is a way to get rid of
this message. 

"
  doctitle = "Suppressing compiler warnings when two glissandos intersect"
} % begin verbatim
Ignore = \once \override NoteColumn #'ignore-collision = ##t

\relative c'' <<
  { b1 \glissando c, } \\
  { \Ignore b1 \glissando \Ignore c' }
>>
