;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 161_10-exercise-calc_wage) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 161:
;
;  Translate the examples into tests and make sure they all succeed. Then change the function
;  in figure 44 so that everyone gets $14 per hour. Now revise the entire program so that changing
;  the wage for everyone is a single change to the entire program and not several.

; Number -> Number
;
; computer the wage for h hour of work

(define per_hour 14)

(define (wage* alon)
  (cond
    [(empty? alon) '()]
    [else (cons (wage (first alon)) (wage* (rest alon)))]))

(define (wage hour)
  (* per_hour hour))

; Test
(check-expect (wage* '()) '())
(check-expect (wage* (cons 28 '()))
              (cons (* per_hour 28) '()))
(check-expect (wage* (cons 40(cons 28 '())))
              (cons (* per_hour 40)(cons (* per_hour 28) '())))
 