;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 147_09-exercise-how_many) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 147:
;
;    Design how-many for NEList-of-temperatures. Doing so completes average, so ensure that average passes all of its tests, too.
;

(define (average a_lot)
  (/ (sum a_lot)
     (how_many a_lot)))

(define (sum a_lot)
  (cond
    [(empty? (rest a_lot)) (first a_lot)]
    [(cons? (rest a_lot)) (+ (first a_lot) (sum (rest a_lot)))]))

(define (how_many a_lot)
  (cond
    [(empty? (rest a_lot)) 1]
    [(cons? (rest a_lot))
     (+ 1 (how_many (rest a_lot)))]))

; Test
(check-expect (sum (cons 1 (cons 2 (cons 3 '())))) 6)

(check-expect (how_many (cons 1 (cons 2 (cons 3 '())))) 3)

(check-expect (average (cons 1 (cons 2 (cons 3 '())))) 2) 
(check-expect (average (cons 1 '())) 1)