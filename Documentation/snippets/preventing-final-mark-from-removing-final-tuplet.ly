%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.31"

\header {
  lsrtags = "rhythms"

  texidoc = "
The addition of a final @code{mark} can result in the loss of a final
tuplet marking.  This can be overcome by setting @code{TupletBracket
#'full-length-to-extent} to @code{false}.

"
  doctitle = "Preventing final mark from removing final tuplet"
} % begin verbatim

\new Staff {
   \set tupletFullLength = ##t
   \time 1/8
   \times 2/3 { c'16 c'16 c'16 }
   \times 2/3 { c'16 c'16 c'16 }
   \times 2/3 { c'16 c'16 c'16 }
   \override Score.RehearsalMark #'break-visibility = ##(#t #t #t)
   \override Score.RehearsalMark #'direction = #down
   \override Score.RehearsalMark #'break-align-symbol =  #'clef
   \override Score.RehearsalMark #'self-alignment-X = #right
   \mark "Composed Feb 2007 - Feb 2008"
}

\new Staff {
   \set tupletFullLength = ##t

   \override TupletBracket #'full-length-to-extent = ##f

   \time 1/8
   \times 2/3 { c'16 c'16 c'16 }
   \times 2/3 { c'16 c'16 c'16 }
   \times 2/3 { c'16 c'16 c'16 }
   \override Score.RehearsalMark #'break-visibility = ##(#t #t #t)
   \override Score.RehearsalMark #'direction = #down
   \override Score.RehearsalMark #'break-align-symbol =  #'clef
   \override Score.RehearsalMark #'self-alignment-X = #right
   \mark "Composed Feb 2007 - Feb 2008"
}


