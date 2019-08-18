;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 066_05-manhattan_distance) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 66:
;
;   manhattan-distance, which measures the Manhattan distance of the given posn to the origin.


(define (distance_to_0 a_posn)
  (+ (posn-x a_posn) (posn-y a_posn)))

(distance_to_0 (make-posn 3 4))
(distance_to_0 (make-posn 6 (* 2 4)))
(+ (distance_to_0 (make-posn 12 5)) 10)