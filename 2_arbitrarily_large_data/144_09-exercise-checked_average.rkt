;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 144_09-exercise-checked_average) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 144:
;
;    Determine how average behaves in DrRacket when applied to the empty list of temperatures.
;    Then design checked-average,afunctionthatproducesaninformativeerrormessagewhenitisappliedto '().
;


(define (average a_lot)
  ( / (sum a_lot)
      (how_many a_lot)))

(define (sum a_lot)
  (cond
    [(empty? a_lot) 0]
    [(cons? a_lot)
     (cond
       [(number? (first a_lot)) (+ (first a_lot) (sum (rest a_lot)))])]))


(define (how_many a_lot)
  (cond
    [(empty? a_lot) 0]
    [(cons? a_lot)
     (cond
       [(number? (first a_lot)) (+ 1 (how_many (rest a_lot)))])]))

(define (checked_average a_lot)
  (cond
    [(empty? a_lot) (error "This list must not be empty")]
    [else (/ (sum a_lot) (how_many a_lot))]))

; Test
(check-error (checked_average '())
             "This list must not be empty")


(check-expect (checked_average (cons 1 (cons 2 (cons 3 '())))) 2)


(check-expect (average (cons 1 (cons 2 (cons 3 '())))) 2)

(sum (cons 1 (cons 2 (cons 3 '()))))
(how_many (cons 1 (cons 2 (cons 3 '()))))