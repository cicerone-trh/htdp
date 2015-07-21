;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2_FunctionsAndPrograms) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/image)
(require 2htdp/batch-io)
;(define aSqr (square 20 "solid" "black"))
;(define tRec (rectangle 10 50 "solid" "red"))
;(define wRec (rectangle 50 10 "solid" "red"))

;; chapter 2 - functions and programs
;; 2.1 Exercises 13-22
(define (dist-to-origin x y)
  (sqrt (+ (sqr x) (sqr y))))
(define (cube-volume l)
  (* l l l))
(define (cube-surface l) ;; would be fun (poly-surf sides length)
  (* 6 l l))
(define (string-first s)
  (string-ith s 0))
(define (string-last s)
  (string-ith s (- (string-length s) 1)))
(define (bool-imply sunny friday)
  (or (not sunny) friday))
(define (image-area img)
  (* (image-width img) (image-height img)))
(define (image-classify img)
  (if (= (image-width img) (image-height img)) "square"
      (if (> (image-width img) (image-height img)) "wide" "tall")))
(define (string-join s1 s2)
  (string-append s1 "_" s2))

(define (string-insert s i)
  (if (and (>= i 0) (< i (string-length s)))
      (string-append (substring s 0 i) "_" (substring s i (string-length s)))
      "index not found for string"))
(define (string-delete s i)
  (if (and (>= i 0) (< i (string-length s)))
       (string-append (substring s 0 i) (substring s (+ i 1) (string-length s)))
       "index not found for string"))

;; 2.2 Computation
;; evaluating function proceeds in 3 steps:
;1: determine values of argument expressions
;2: checks that (= args fx-params)
;3: computes body of fx, replacing args

;; 2.2 Exercise 23-28
(define (ff a) (* a 10))
;(ff (ff 1))
;(+ (ff 1) (ff 1))
;(dist-to-origin 3 4)
;(string-first "hello")
;(bool-imply true false)
#|(define (img-cl img)
  (cond
    [(>= (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(<= (image-height img) (image-width img)) "wide"]))
(img-cl (circle 3 "solid" "red"))|#
;(string-insert "helloworld" 0)