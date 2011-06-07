\version "2.14.0"
\header {
  texidoc="Festival song synthesis output supports
changing tempo in the middle of a piece.
"
}
\include "festival.ly"

\festival #"song-tempo.xml" { \tempo 4=90 }
{
\time 3/4
\relative c' { c4 e g \tempo 4=60 c, e g }
\addlyrics { do re mi do re mi }
}
#(ly:progress "song-tempo")
#(ly:progress "~a" (ly:gulp-file "song-tempo.xml"))
