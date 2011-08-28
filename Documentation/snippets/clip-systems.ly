% DO NOT EDIT this file manually; it is automatically
% generated from Documentation/snippets/new
% Make any changes in Documentation/snippets/new/
% and then run scripts/auxiliar/makelsr.py
%
% This file is in the public domain.
%% Note: this file works from version 2.14.0
\version "2.14.0"

\header {
%% Translation of GIT committish: 70f5f30161f7b804a681cd080274bfcdc9f4fe8c
  texidoces = "
Este código muestra cómo recortar (extraer) fragmentos a partir de una
partitura completa.

Este archivo tiene que procesarse de forma separada con la opción
@code{-dclip-systems}; la página de fragmentos de código podría no
mostrar el resultado adecuadamente.

La salida consiste en archivos con los nombres
@samp{base-from-inicio-to-final[-número].eps}.


Si se incluyen los comienzos y finales de los sistemas, incluyen las
dimensiones del grob del sistema, por ejemplo los nombres de
instrumento.


Las notas de adorno en el punto final de la región no se incluyen.


Las regiones pueden abarcar varios sistemas.  En este caso, se generan
varios archivos EPS.

"
  doctitlees = "Recorte de sistemas"

  lsrtags = "paper-and-layout"

  texidoc = "
This code shows how to clip (extract) snippets from a full score.

This file needs to be run separately with @option{-dclip-systems}; the
snippets page may not adequately show the results.

The result will be files named
@samp{base-from-start-to-end[-count].eps}.


If system starts and ends are included, they include extents of the
System grob, e.g., instrument names.


Grace notes at the end point of the region are not included.


Regions can span multiple systems.  In this case, multiple EPS files
are generated.

"
  doctitle = "Clip systems"
} % begin verbatim


#(ly:set-option 'clip-systems)
#(define output-suffix "1")

origScore = \score {
  \relative c' {
    \set Staff.instrumentName = #"bla"
    c1
    d1
    \grace c16 e1
    \key d \major
    f1 \break
    \clef bass
    g,1
    fis1
  }
}

\book {
  \score {
    \origScore
    \layout {
      % Each clip-region is a (START . END) pair
      % where both are rhythmic-locations.

      % (make-rhythmic-locations BAR-NUMBER NUM DEN)
      % means NUM/DEN whole-notes into bar numbered BAR-NUMBER

      clip-regions = #(list
      (cons
       (make-rhythmic-location 2 0 1)
       (make-rhythmic-location 4 0 1))

      (cons
       (make-rhythmic-location 0 0 1)
       (make-rhythmic-location 4 0 1))

      (cons
       (make-rhythmic-location 0 0 1)
       (make-rhythmic-location 6 0 1))
      )
    }
  }
}

#(ly:set-option 'clip-systems #f)
#(define output-suffix #f)

\book {
  \score { \origScore }
  \markup { \bold \fontsize #6 clips }
  \score {
    \lyrics {
      \markup { from-2.0.1-to-4.0.1-clip.eps }
      \markup {
        \epsfile #X #30.0 #(format #f "~a-1-from-2.0.1-to-4.0.1-clip.eps"
                            (ly:parser-output-name parser)) }
    }
  }
}
