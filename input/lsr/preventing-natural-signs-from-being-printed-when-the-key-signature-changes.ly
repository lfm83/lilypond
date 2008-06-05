%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.48"

\header {
  lsrtags = "pitches"

  texidoc = "
When the key signature changes, natural signs are automatically printed
to cancel any accidentals from previous key signatures.  This may be
prevented by setting to \"false\" the @code{printKeyCancellation}
property in the @code{Staff} context. 

"
  doctitle = "Preventing natural signs from being printed when the key signature changes"
} % begin verbatim
\relative c' {
  \key d \major
  a4 b cis d
  \key g \minor
  a4 bes c d
  \set Staff.printKeyCancellation = ##f
  \key d \major
  a4 b cis d
  \key g \minor
  a4 bes c d
}
