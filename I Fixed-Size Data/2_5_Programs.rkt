;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2_5_Programs) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/batch-io)
(require 2htdp/universe)
(require 2htdp/image)

; notes: Introduce definitions for all constants mentioned in a problem statement.
(define (f2c f)
  (* 5/9 (- f 32)))
(define (convert in out)
  (write-file out
              (string-append
               (number->string
                (f2c
                 (string->number
                  (read-file in))))
               "\n")))

;; 2.5 Exercise 33
(define (letter fst lst signature-name)
  (string-append
    (opening fst)
    "\n\n"
    (body fst lst)
    "\n\n"
    (closing signature-name)))

(define (opening fst)
  (string-append "Dear " fst ","))
 
(define (body fst lst)
  (string-append
   "We have discovered that all people with the last name " "\n"
   lst " have won our lottery. So, " fst ", " "\n"
   "hurry and pick up your prize."))
 
(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

; a letter-writing batch program that 1:reads names from three files and 2:writes a letter to one:
#|(define (main in-fst in-lst in-sig out)
  (write-file out
            (letter (read-file in-fst)
                    (read-file in-lst)
                    (read-file in-sig))))
|#
;(write-file "dat/first.dat" "Tyler")
;(write-file "dat/last.dat" "Hammond")
;(write-file "dat/sig.dat" "TRH")
;(main "dat/first.dat" "dat/last.dat" "dat/sig.dat" 'stdout)

;; 2.5 Exercise 34 -- I refuse to include "on boredom"
; 1. human-wake
; 2. human-sleep
; 3. sexual-arousal
; 4. sexual-climax
; 5. money-expenditure
; 6. money-income
; 7. communication-desire
; 8. communication-established
; 9. new-paradigm-of-experience (e.g. encounters new food)
;10. new-paradigm-of-desire (e.g. wants to learn painting)

;;;INTERACTIVE PROGRAMS, BIG-BANG FUNCTION, EVENTS, HANDLERS;;;;;;;;;;;;;;;;;;;;;;;;

(define (number->square s)
  (square s "solid" "red"))
(define (reset s ke)
  100)

;? Stop! Why does tock not get applied to the event?
;; because only 1 function (event handler) produces a new state
;; that is, "tock" is not the "time slot" or "world state", but only ONE EVENT that MAY occupy a "time slot"
;;;; that generates a new world state

;; my question is: does to-draw fire _every time_ the world state changes, then?

(define (main y)
  (big-bang y
            [on-tick sub1]
            [stop-when zero?]
            [to-draw place-dot-at]
            [on-key stop]))
(define (place-dot-at y)
  (place-image (circle 3 "solid" "red") 50 y (empty-scene 100 100)))
(define (stop s ke)
  (+ s 15))
(main 100)