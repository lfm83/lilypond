%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.48"

\header {
  lsrtags = "expressive-marks"

  texidoc = "
Cross-staff arpeggios can be created in contexts other than
@code{PianoStaff} if the @code{Span_arpeggio_engraver} is included in
the @code{Score} context. 

"
  doctitle = "Creating cross-staff arpeggios in other contexts"
} % begin verbatim
\score {
  \new StaffGroup {
    \set Score.connectArpeggios = ##t
    <<
      \new Voice \relative c' {
        <c e>2\arpeggio
        <d f>2\arpeggio
        <c e>1\arpeggio
      }
      \new Voice  \relative c {
        \clef bass
         <c g'>2\arpeggio
         <b g'>2\arpeggio
         <c g'>1\arpeggio
      }
    >>
  }
  \layout {
    \context {
      \Score
      \consists "Span_arpeggio_engraver"
    }
  }
}
