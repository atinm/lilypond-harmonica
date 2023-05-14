%{
A small file to help when scoring notation for harmonicas.

This file relies heavily on work presented by Bradford Powell in
the following thread;

http://osdir.com/ml/lilypond-user-gnu/2010-04/msg00250.html
%}

\version "2.22.0"

flutter = #(define-event-function (parser location) ()
  #{ :32 #}
)

shake = #(define-event-function (parser location) ()
  #{ :32 #}
)


pull = {
   \once \override Staff.NoteHead.style = #'slash
  }

quartertone =
#(let ((m (make-articulation 'stopped)))
   (set! (ly:music-property m 'tweaks)
      (acons 'font-size 2 (ly:music-property m 'tweaks)))
   m)
slap =
#(let ((m (make-articulation 'flageolet)))
   (set! (ly:music-property m 'tweaks)
      (acons 'font-size -3 (ly:music-property m 'tweaks)))
   m)

dip =
#(let ((m (make-articulation 'upbow)))
   (set! (ly:music-property m 'tweaks)
      (acons 'font-size -3 (ly:music-property m 'tweaks)))
   m)

#(define (NoteEvent? music)
   (equal? (ly:music-property music 'name) 'NoteEvent))

#(define* (blow hole #:optional (bends 0))
  (case bends
    ((0) (markup (#:concat ("+" hole))))
    ((1) (markup (#:concat ("+" hole "'"))))
    ((2) (markup (#:concat ("+" hole "''"))))
    (else (markup "B"))))

#(define* (draw hole #:optional (bends 0))
  (case bends
    ((0) (markup (#:concat ("-" hole))))
    ((1) (markup (#:concat ("-" hole "'"))))
    ((2) (markup (#:concat ("-" hole "''"))))
    ((3) (markup (#:concat ("-" hole "'''"))))
    ((4) (markup (#:concat ("-" hole "'"))))
    ((5) (markup (#:concat ("-" hole "'"))))
    ((6) (markup (#:concat ("-" hole "'"))))
    ((7) (markup (#:concat ("-" hole "'"))))
    ((8) (markup (#:concat ("-" hole "'"))))
    ((9) (markup (#:concat ("-" hole "''"))))
    ((10) (markup (#:concat ("-" hole "''"))))
    (else (markup "D"))))

#(define* (dup hole1 hole2)
   (markup (#:concat ("-" hole1 "/+" hole2))))

#(define (overblow hole)
   (markup (#:concat ("+" hole "o"))))

#(define (overdraw hole)
   (markup (#:concat ("-" hole "o"))))

#(define (slide hole)
   (markup (#:concat (hole "<"))))

#(define (low-register hole)
   (markup (#:concat (hole "°"))))

#(define (get-diatonic-c-powerbender-tab NoteEvent)
   (case (ly:pitch-semitones (ly:music-property NoteEvent 'pitch))
    ((0) (blow "1"))
    ((1) (draw "1" 1))
    ((2) (draw "1"))
    ((3) (overblow "1"))
    ((4) (blow "2"))
    ((5) (draw "2" 2))
    ((6) (draw "2" 1))
    ((7) (dup "2" "3"))
    ((8) (draw "3" 3))
    ((9) (draw "3" 2))
    ((10) (draw "3" 1))
    ((11) (draw "3"))
    ((12) (blow "4"))
    ((13) (draw "4" 1))
    ((14) (dup "4" "5"))
    ((15) (draw "5" 1))
    ((16) (draw "5"))
    ((17) (blow "6"))
    ((18) (draw "6" 1))
    ((19) (draw "6"))
    ((20) (overblow "6"))
    ((21) (blow "7"))
    ((22) (draw "7" 1))
    ((23) (draw "7"))
    ((24) (blow "8"))
    ((25) (draw "8" 1))
    ((26) (draw "8"))
    ((27) (overblow "8"))
    ((28) (blow "9"))
    ((29) (draw "9" 2))
    ((30) (draw "9" 1))
    ((31) (draw "9"))
    ((32) (overblow "9"))
    ((33) (blow "10"))
    ((34) (draw "10" 2))
    ((35) (draw "10" 1))
    ((36) (draw "10"))
    ((37) (overblow "10"))
    (else (markup "X"))))

#(define (get-chromatic-c-solo-tab NoteEvent)
   (case (ly:pitch-semitones (ly:music-property NoteEvent 'pitch))
    ((-12) (blow (low-register "1")))          
    ((-11) (blow (slide (low-register "1"))))  
    ((-10) (draw (low-register "1")))          
    ((-9) (draw (slide (low-register "1"))))   
    ((-8) (blow (low-register "2")))           
    ((-7) (draw (low-register "2")))           
    ((-6) (draw (slide (low-register "2"))))   
    ((-5) (blow (low-register "3")))           
    ((-4) (blow (slide (low-register "3"))))   
    ((-3) (draw (low-register "3")))           
    ((-2) (draw (slide (low-register "3"))))   
    ((-1) (draw (low-register "4")))           
    
    ((0) (blow "1"))           
    ((1) (slide (blow "1")))   
    ((2) (draw "1"))           
    ((3) (slide (draw "1")))    
    ((4) (blow "2"))           
    ((5) (draw "2"))           
    ((6) (slide (draw "2")))   
    ((7) (blow "3"))           
    ((8) (slide (blow "3")))   
    ((9) (draw "3"))           
    ((10) (slide (draw "3")))  
    ((11) (draw "4"))          
    
    ((12) (blow "5"))          
    ((13) (slide (blow "5")))   
    ((14) (draw "5"))           
    ((15) (slide (draw "5")) )   
    ((16) (blow "6"))           
    ((17) (draw "6"))           
    ((18) (slide (draw "6")))   
    ((19) (blow "7"))           
    ((20) (slide (blow "7")))   
    ((21) (draw "7"))           
    ((22) (slide (draw "7")))  
    ((23) (draw "8"))          
    
    ((24) (blow "9"))           
    ((25) (slide (blow "9")))    
    ((26) (draw "9"))            
    ((27) (slide (draw "9")))   
    ((28) (blow "10"))           
    ((29) (draw "10"))           
    ((30) (slide (draw "10")))   
    ((31) (blow "11"))           
    ((32) (slide (blow "11")))   
    ((33) (draw "11"))           
    ((34) (slide (draw "11")))  
    ((35) (draw "12"))          
    
    ((36) (blow "12"))          
    ((37) (slide (blow "12")))  
    ((38) (slide (draw "12")))  
    (else (markup "X"))))

#(define (make-textscript dir txt)
   (make-music 'TextScriptEvent
               'direction dir
               'text txt))

#(define (make-tab-number NoteEvent tuning)
   (make-textscript
     DOWN
     (case tuning
       ((diatonic-c-powerbender) (get-diatonic-c-powerbender-tab NoteEvent))
       ((chromatic-c-solo) (get-chromatic-c-solo-tab NoteEvent))
       (else (diatonic-c-powerbender) (get-diatonic-c-powerbender-tab NoteEvent)))))

#(define (make-tab-numbers EventChord tuning)
   (let ((elts (ly:music-property EventChord 'elements)))
     (map make-tab-number (filter NoteEvent? elts))))

#(define (append-property! music property element)
     (set! (ly:music-property music property)
                (append! (ly:music-property music property)
		                    (list element)))
				         music)

#(define* (add-diatonic-c-powerbender-tabs m)
   (cond ((music-is-of-type? m 'event-chord)
       (set! (ly:music-property m 'elements)
             (append (ly:music-property m 'elements)
                     (reverse (make-tab-numbers m 'diatonic-c-powerbender)))))
         ((music-is-of-type? m 'note-event)
       (set! (ly:music-property m 'articulations)
             (append (ly:music-property m 'articulations)
                     (list (make-tab-number m 'diatonic-c-powerbender)))))
	(else #f)
    )
    m)

#(define* (add-chromatic-c-solo-tabs m)
   (cond ((music-is-of-type? m 'event-chord)
       (set! (ly:music-property m 'elements)
             (append (ly:music-property m 'elements)
                     (reverse (make-tab-numbers m 'chromatic-c-solo)))))
         ((music-is-of-type? m 'note-event)
       (set! (ly:music-property m 'articulations)
             (append (ly:music-property m 'articulations)
                     (list (make-tab-number m 'chromatic-c-solo)))))
	(else #f)
    )
    m)

diatonicHarmonicaTab =
#(define-music-function
  (parser location music)
  (ly:music?)
  (music-map add-diatonic-c-powerbender-tabs music))

chromaticHarmonicaTab =
#(define-music-function
  (parser location music)
  (ly:music?)
  (music-map add-chromatic-c-solo-tabs music))
