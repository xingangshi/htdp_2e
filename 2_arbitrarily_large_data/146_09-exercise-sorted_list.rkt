;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 146_09-exercise-sorted_list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 146:
;
;    Design sorted>?. The function consumes a NEList-of-temperatures. It produces #true if the temperatures are sorted
;    in descending order, that is, if the second is smaller than the first, the third smaller than the second, and so on.
;    Otherwise it produces #false.
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

; Test
(check-expect (average (cons 1 (cons 2 (cons 3 '())))) 2) 