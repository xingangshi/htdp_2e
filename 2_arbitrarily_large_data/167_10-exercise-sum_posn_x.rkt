;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 167_10-exercise-sum_posn_x) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 167:
;
;  Design the function sum, which consumes a list of Posns and produces the sum of all of its x-coordinates.
;

(define (sum l_o_p)
  (cond
    [(empty? l_o_p) 0]
    [else
     (+ (posn-x (first l_o_p)) (sum (rest l_o_p)))]))

; Test
(check-expect (sum '()) 0)
(check-expect (sum (cons (make-posn 1 2) '())) 1)
(check-expect (sum (cons (make-posn 1 2)(cons (make-posn 2 3) '()))) 3)
