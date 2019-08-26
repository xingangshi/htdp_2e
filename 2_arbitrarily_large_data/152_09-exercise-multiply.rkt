;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 152_09-exercise-multiply) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 152:
;
;   Design the function multiply. It consumes a natural number n and multiplies it with some arbitrary number x without using *.
;
;   Use DrRacket’s stepper to evaluate (multiply 3 x) for any x you like. How does multiply relate to what you know from grade school.
;


(define (multiply n x)
  (cond
    [(zero? n) 0]
    [(positive? n) (+ x  (multiply (sub1 n) x))]))

; Test
(check-expect (multiply 2 2) (* 2 2))

(check-expect (multiply 3 2) (* 3 2))
