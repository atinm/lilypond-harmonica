
\version "2.24.1"

\include "harmonica-powerbender.ly"
\include "style.ly"

\header {
    title = "Rock and Blues Scales"
}
majorPentatonicScaleSecond = {
   d'^\markup { V } e^\markup { VI } g^\markup { I } a^\markup { II } b^\markup { III } d^\markup { V }
   e^\markup { VI } g^\markup { I } a^\markup { II } b^\markup { III } d^\markup { V }
   e^\markup { VI } g^\markup { I } a^\markup { II } a^\markup { II } g^\markup { I } e^\markup { VI }
   d^\markup { V } b^\markup { III } a^\markup { II } g^\markup { I } e^\markup { VI } d^\markup { V }
   b^\markup { III } a^\markup { II } g^\markup { I } e^\markup { VI } d'^\markup { V }
 }

bluesScaleSecond = {
   c'^\markup { IV } des^\markup { Vb } d^\markup { V } f^\markup { VIIb }
   g^\markup { I } bes^\markup { IIIb } c^\markup { IV } des^\markup { Vb } d^\markup { V } f^\markup { VIIb }
   g^\markup { I } bes^\markup { IIIb } c^\markup { IV } des^\markup { Vb } d^\markup { V } f^\markup { VIIb }
   g^\markup { I } bes^\markup { IIIb } c^\markup { IV } des^\markup { Vb } 
   des^\markup { Vb } c^\markup { IV } bes^\markup { IIIb } g^\markup { I }
   f^\markup { VIIb } d^\markup { V } des^\markup { Vb } c^\markup { IV } bes^\markup { IIIb } g^\markup { I }
   f^\markup { VIIb } d^\markup { V } des^\markup { Vb } c^\markup { IV } bes^\markup { IIIb } g^\markup { I }
   f^\markup { VIIb } d^\markup { V } des^\markup { Vb } c'^\markup { IV }
}

minorPentatonicSecond = {
    c'^\markup { IV } d^\markup { V } f^\markup { VIIb } g^\markup { I } bes^\markup { IIIb } c^\markup { IV } d^\markup { V } f^\markup { VIIb } g^\markup { I } bes^\markup { IIIb } c^\markup { IV } d^\markup { V } f^\markup { VIIb } g^\markup { I } bes^\markup { IIIb } c^\markup { IV }
    c^\markup { IV } bes^\markup { IIIb } g^\markup { I } f^\markup { VIIb } d^\markup { V } c^\markup { IV } bes^\markup { IIIb } g^\markup { I } f^\markup { VIIb } d^\markup { V } c^\markup { IV } bes^\markup { IIIb } g^\markup { I }
}

\score {
    \header {
        piece = \markup { \vspace #'2 \fill-line { \bold \huge "Major Pentatonic Scale - 2nd position" } }
    }
    \new Staff \diatonicHarmonicaTab \relative c {
        \time 4/4
        \majorPentatonicScaleSecond
    }
}

\score {
    \header {
        piece = \markup { \vspace #'2 \fill-line { \bold \huge "Blues Scale - 2nd position" } }
    }
    \new Staff \diatonicHarmonicaTab \relative c {
        \time 4/4
        \bluesScaleSecond
    }
} 

\score {
    \header {
        piece = \markup { \vspace #'2 \fill-line { \bold \huge "Minor Pentatonic Scale - 2nd position" } }
    }
    \new Staff \diatonicHarmonicaTab \relative c {
        \time 4/4
        \minorPentatonicSecond
    }
} 
