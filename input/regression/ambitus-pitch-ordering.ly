\version "2.14.0"

\header {
  texidoc = "Ambitus use actual pitch not lexicographic ordering."
}

\new Voice \with { \consists "Ambitus_engraver" } {
  \clef F
  c4 eis fes2
}

