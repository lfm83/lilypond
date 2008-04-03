%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.38"

\header {
  lsrtags = "tweaks-and-overrides, spacing"
 texidoc = "
By setting the @code{Y-extent} property to a fixed value, all
@code{DynamicLineSpanner} objects (hairpins and dynamic texts) are
aligned to a common reference point, regardless of their actual extent.
This way, every element will be vertically centered, for a nicer output
(you can compare the first and the second line in this example; the
trick is only applied on the second line).

The same idea is used to align the text scripts along their baseline.
" }
% begin verbatim
music = \relative c'' {
  c2\p^\markup { "gorgeous" } c\f^\markup { "fantastic" }
  c4\p c\f\> c c\!\p
}

{
  \music \break
  \override DynamicLineSpanner #'staff-padding = #2.0
  \override DynamicLineSpanner #'Y-extent = #'(-1.5 . 1.5)
  \override TextScript #'Y-extent = #'(-1.5 . 1.5)
  \music
}
