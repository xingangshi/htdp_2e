;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 145_09-exercise-nelist_of_temperatures) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 145:
;
;    Would sum and how-many work for NEList-of-temperatures even if they were designed for inputs
;    from List-of- temperatures? If you think they don’t work, provide counter-examples. If you think they would, explain why.
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