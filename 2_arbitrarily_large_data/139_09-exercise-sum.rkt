;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 139_09-exercise-sum) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 139:
;
; Design the sum function, which consumes a List-of-amounts and computes the sum of
; the amounts. Use DrRacket’s stepper to see how (sum l) works for a short list l in List-of-amounts. 
;


; A List-of-amounts is one of: 
; – '()
; – (cons PositiveNumber List-of-amounts)


(define (sum list_of_amouts)
  (cond
    [(empty? list_of_amouts) 0]
    [(cons? list_of_amouts)
     (+ (first list_of_amouts) (sum (rest list_of_amouts)))]))

; Test
(check-expect (sum (cons 10 (cons 20 (cons 30 '())))) 60)
(check-expect (sum (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 '())))))) 15)
(check-expect (sum (cons 0 '())) 0)
(check-expect (sum '()) 0)
