%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.16"

\header {
%% Translation of GIT committish: 5a7301fc350ffc3ab5bd3a2084c91666c9e9a549
  texidoces = "
Se puede variar la longitud de las plicas de las figuras unidas por
una barra mediante la sobreescritura de la propiedad
@code{beamed-lengths} de los detalles (@code{details}) del objeto
@code{Stem}.  Si se utiliza un solo valor como argumento, la longitud
se aplica a todas las plicas.  Si se usan varios argumentos, el
primero se aplica a las corcheas, el sgundo a las semicorcheas y así
sucesivamente.  El último argumento también se aplica a todas las
figuras que son mmás cortas que la longitud de la figura del último
argumento.  También se pueden usar argumentos no enteros.

"

doctitlees = "Alterar la longitud de las plicas unidas por una barra"



  lsrtags = "pitches, tweaks-and-overrides"

  texidoc = "
Stem lengths on beamed notes can be varied by overriding the
@code{beamed-lengths} property of the @code{details} of the
@code{Stem}.  If a single value is used as an argument, the length
applies to all stems.  When multiple arguments are used, the first
applies to eighth notes, the second to sixteenth notes and so on.  The
final argument also applies to all notes shorter than the note length
of the final argument.  Non-integer arguments may also be used.

"
  doctitle = "Altering the length of beamed stems"
} % begin verbatim

\relative c'' {
  \override Stem #'details #'beamed-lengths = #'(2)
  a8[ a] a16[ a] a32[ a]
  \override Stem #'details #'beamed-lengths = #'(8 10 12)
  a8[ a] a16[ a] a32[ a] r8
  \override Stem #'details #'beamed-lengths = #'(8)
  a8[ a]
  \override Stem #'details #'beamed-lengths = #'(8.5)
  a8[ a]
  \revert Stem #'details
  a8[ a] a16[ a] a32[ a]
}
