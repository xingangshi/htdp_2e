;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 060_04-exercise-sale_taxes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 60:
;
;    Introduce constant definitions that separate the intervals for
;    low prices and luxury prices from the others so that the legislators
;    in Tax Land can easily raise the taxes even more. 
;

(define taxes_level_1  1000)
(define taxes_level_2  10000)


(define (sales_taxes price)
  (cond
    [(and (>= price 0) (< price taxes_level_1)) 0]
    [(and (>= price taxes_level_1) (< price taxes_level_2)) (* price 0.05)]
    [(>= price taxes_level_2) (* price 0.08)]))

; Test
(check-expect (sales_taxes     0)  0)
(check-expect (sales_taxes   537)  0)
(check-expect (sales_taxes  1000) (* 0.05  1000))
(check-expect (sales_taxes  1282) (* 0.05  1282))
(check-expect (sales_taxes 10000) (* 0.08 10000))
(check-expect (sales_taxes 12017) (* 0.08 12017))                                      
