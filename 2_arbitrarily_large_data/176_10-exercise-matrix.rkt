;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 176_10-exercise-matrix) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 176:
;
;   Mathematics teachers may have introduced you to matrix calculations by now. Numeric programs deal with those, too. In principle, matrix just means rectangle of numbers.
;
;   transpose works. You should also understand that you cannot design this function with the design recipes you have seen so far. Explain why.
;   Design the two “wish list” functions. Then complete the design of the transpose with some test cases.

(require 2htdp/batch-io) 

; A Matrix is one of:
; – (cons Row '())
; – (cons Row Matrix)
; constraint all rows in matrix are of the same length

; An Row is one of:
; – '()
; – (cons Number Row)

(define row1 (cons 11 (cons 12 '())))
(define row2 (cons 21 (cons 22 '())))
(define mat1 (cons row1 (cons row2 '())))

; Matrix -> Matrix
; transpose the items on the given matrix along the diagonal
(define wor1 (cons 11 (cons 21 '())))
(define wor2 (cons 12 (cons 22 '())))
(define tam1 (cons wor1 (cons wor2 '())))

(define (transpose lln)
  (cond
    [(empty? (first lln)) '()]
    [else (cons (first* lln) (transpose (rest* lln)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (first* m) 
  (cond
    [(empty? m) '()]
    [else (cons (first (first m)) (first* (rest m)))]))

(define (rest* m) 
  (cond
    [(empty? m) '()]
    [else (cons (rest (first m)) (rest* (rest m)))]))


; Test
(check-expect (rest* mat1) (cons 
                            (cons 12 '()) 
                            (cons (cons 22 '()) 
                                  '())))
(check-expect (first* mat1) (cons 11 (cons 21 '())))

(check-expect (transpose mat1) tam1)