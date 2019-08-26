;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-09_02-average) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


; A list_of_numbers is one of
;
;   - '()
;   - (cons CTemperature list_of_temperatures)
;
; A CTemperature is a Number greater or euqual to -273


(define (average a_lot)
  ( / (sum a_lot)
      (how_many a_lot)))

(define (sum a_lot)
  (cond
    [(empty? a_lot) 0]
    [(cons? a_lot)
     (cond
       [(number? (first a_lot)) (+ (first a_lot) (how_many (rest a_lot)))]
       [else "bbbb"])]))


(define (how_many a_lot)
  (cond
    [(empty? a_lot) 0]
    [(cons? a_lot)
     (cond
       [(number? (first a_lot)) (+ 1 (how_many (rest a_lot)))]
       [else "aaaa"])]))


; Test
(check-expect (average (cons 1 (cons 2 (cons 3 '())))) 2)

(how_many (cons 1 (cons 2 (cons 3 '()))))