;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 153_09-exercise-col_rows) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 153:
;
;   Design two functions: col and row.
;
;   The function col consumes a natural number n and an image img. It produces a column— a vertical arrangement— of n
;   copies of img.
;
;   The function row consumes a natural number n and an image img. It produces a row— a horizontal arrangement— of n
;   copies of img.

(require 2htdp/image)

(define (col n img)
  (cond
    [(zero? n) (empty-scene 0 0)]
    [(positive? n) (above img (col (sub1 n) img))]))

(define (row n img)
  (cond
    [(zero? n) (empty-scene 0 0)]
    [(positive? n) (beside img (row (sub1 n) img))]))

; Test
(check-expect (col 3 (square 10 "outline" "black"))
              (above (square 10 "outline" "black")
                     (square 10 "outline" "black")
                     (square 10 "outline" "black")))


(check-expect (row 3 (square 10 "outline" "black"))
              (beside (square 10 "outline" "black")
                      (square 10 "outline" "black")
                      (square 10 "outline" "black")))