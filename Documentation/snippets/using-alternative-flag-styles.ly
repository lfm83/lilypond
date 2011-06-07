%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.0"

\header {
  lsrtags = "rhythms, tweaks-and-overrides"

%% Translation of GIT committish: 59caa3adce63114ca7972d18f95d4aadc528ec3d
  texidoces = "

Se pueden imprimir estilos alternativos del corchete o gancho de las
corcheas y figuras menores, mediante la sobreescritura de la propiedad
@code{flag} del objeto @code{Stem}.  Son valores válidos
@code{modern-straight-flag} y @code{old-straight-flag}.

"
  doctitlees = "Uso de estilos alternativos para los corchetes"



  texidoc = "
Alternative styles of flag on eighth and shorter notes can be displayed
by overriding the @code{flag} property of @code{Stem}.  Valid values
are @code{modern-straight-flag} and @code{old-straight-flag}.

"
  doctitle = "Using alternative flag styles"
} % begin verbatim

testnotes = {
  \autoBeamOff
  c8 d16 c32 d64 \acciaccatura { c8 } d64 r4
}

\relative c' {
  \time 2/4
  \testnotes

  \override Stem #'flag = #modern-straight-flag
  \testnotes

  \override Stem #'flag = #old-straight-flag
  \testnotes

  \revert Stem #'flag
  \testnotes
}

