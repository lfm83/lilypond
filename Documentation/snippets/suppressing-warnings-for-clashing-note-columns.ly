%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.0"

\header {
  lsrtags = "simultaneous-notes, tweaks-and-overrides"

  texidoc = "
If notes from two voices with stems in the same direction are placed at
the same position, and both voices have no shift or the same shift
specified, the error message @samp{warning: ignoring too many clashing
note columns} will appear when compiling the LilyPond file.  This
message can be suppressed by setting the @code{'ignore-collision}
property of the @code{NoteColumn} object to @code{#t}.

"
  doctitle = "Suppressing warnings for clashing note columns"
} % begin verbatim

ignore = \override NoteColumn #'ignore-collision = ##t

\relative c' {
  <<
    \ignore
    { \stemDown f2 g }
    \\
    { c2 c, }
  >>
}
