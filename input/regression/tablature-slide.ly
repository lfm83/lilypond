\header
{

  texidoc = "Tab supports slides."
}

\version "2.14.0"
\paper {
  ragged-right = ##T
}


\relative \new TabVoice
{
  <c g'\harmonic> d\2\glissando e\2
}
