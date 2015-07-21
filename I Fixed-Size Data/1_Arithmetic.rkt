;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1_Arithmetic) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; I didn't think to save my exercises initially. This first commit is thus lacking :)

(require 2htdp/image)
(define cat (rectangle 75 117 "solid" "brown")) ;; image, removed for readability in github
(define (pxcnt img)
  (* (image-width img)(image-height img)))

;; 1.4 Exercise 6
(define wheel (circle 10 "solid" "black"))
(define body (rectangle 100 25 "solid" "red"))
(define automobile
  (overlay/offset wheel 35 -5
                  (overlay/offset wheel -35 -10 body)))
;automobile

;; 1.4 Exercise 7
(define ocean (empty-scene 100 100))
(define mast (rectangle 8 40 "solid" "brown"))
(define hull (rectangle 40 25 "solid" "brown"))
(define sail (triangle 50 "solid" "red"))

(define (drawboat x y scene)
  (place-image hull x (+ y 30)
               (place-image mast x y
                            (place-image sail x (- y 20) scene))))
;(drawboat 50 65 ocean)

;; 1.4 Exercise 8
(define canopy (triangle 50 "solid" "green"))
(define trunk (rectangle 10 40 "solid" "brown"))
(define tree
  (underlay/xy trunk -20 -65
               (overlay/xy canopy 0 20
                           (overlay/xy canopy 0 20 canopy))))
;tree

;; 1.5 Exercise 9
(define sunny #true)
(define friday #false)
;(or (not sunny) friday)

;; 1.6 Exercise 10
(define aSqr (square 10 "solid" "black"))
(define wRec (rectangle 50 10 "solid" "black"))
(define tRec (rectangle 10 50 "solid" "black"))

(define (prime-dimension img)
  (if (= (image-width img) (image-height img)) "square"
      (if (< (image-width img) (image-height img)) "tall" "wide")))
;(prime-dimension cat)
;(prime-dimension aSqr)
;(prime-dimension wRec)
;(prime-dimension tRec)

;; 1.7 Exercise 11
(define (as-number in)
  (if (string? in) (string-length in)
      (if (image? in) (pxcnt in)
          (if (number? in) (if (> in 0) (- in 1) in)
              (if (boolean? in) (if in 10 20)
                  "unknown data")))))
#|
(as-number "hello")
(as-number cat)
(as-number 5)
(as-number 0)
(as-number -5)
(as-number #true)
(as-number #false)
|#