\version "2.14.0"
\header {texidoc="Markup scripts may be stacked."}
\layout { ragged-right = ##t}
{
  c''^\markup {
    "a"
    \column { "1" \bold "2"  "3" }
  }
} 


