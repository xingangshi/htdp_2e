;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 151_09-exercise-add_to_pi) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 151:
;
;   Design the function add-to-pi. It consumes a natural number n and adds it to pi without using + from BSL. Here is a start:
;
;     N -> Number
;     computes (+ n pi) without using +
;
;     (check-within (add-to-pi 3) (+ 3 pi) 0.001)
;     (define (add-to-pi n)
;        pi)
;
;   Once you have a complete definition, generalize the function to add, which adds a natural number n to some arbitrary number
;   x without using +. Why does the skeleton use check-within?

(define (add_to_pi n)
  (cond
    [(zero? n) pi]
    [(positive? n) (add1 (add_to_pi (sub1 n)))]))

; Test
(check-within (add_to_pi 3) (+ 3 pi) 0.001)

