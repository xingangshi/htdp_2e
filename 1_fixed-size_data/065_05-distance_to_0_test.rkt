;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 065_05-distance_to_0_test) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 65:
;   Show all steps. Assume that sqr performs its computation
;   in a single step. Check the results with DrRacket’s stepper.


(define (distance_to_0 a_posn)
  (sqrt (+ (expt (posn-x a_posn) 2) (expt (posn-y a_posn) 2))))

(distance_to_0 (make-posn 3 4))
(distance_to_0 (make-posn 6 (* 2 4)))
(+ (distance_to_0 (make-posn 12 5)) 10)