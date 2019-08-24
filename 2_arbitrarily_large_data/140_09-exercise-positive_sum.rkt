;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 140_09-exercise-positive_sum) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 140:
;
; Design the function pos?, which consumes a List-of-numbers and determines whether all numbers are positive
; numbers. In other words, if (pos? l) yields #true, then l is an element of List-of-amounts. Use DrRacket’s
; stepper to understand how pos? works for (cons 5 '()) and (cons -1 '()).
;


; A List-of-amounts is one of: 
; – '()
; – (cons PositiveNumber List-of-amounts)


(define (pos? list_of_amounts)
  (cond
    [(empty? list_of_amounts) #true]
    [(cons? list_of_amounts)
     (cond
       [(< (first list_of_amounts) 0) #false]
       [else (pos? (rest list_of_amounts))])]))

; Test
(check-expect (pos? '()) true)
(check-expect (pos? (cons 1 (cons 2 (cons 3 '())))) true)
(check-expect (pos? (cons 1 (cons 2 (cons -3'())))) false)