;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 164_10-exercise-convert_euro) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 164:
;
;  Design the function convert-euro,
;  which converts a list of US$ amounts into a list of € amounts. Look up the current exchange rate on the web.
;
;  Generalize convert-euro to the function convert-euro*, which consumes an exchange rate and a list of US$ amounts and converts the latter into a list of € amounts.

(define trans_size 0.88859)

(define (convert_euro lod)
  (cond
    [(empty? lod) '()]
    [else (cons (* trans_size (first lod)) (convert_euro (rest lod)))]))

(define (convert_euro* rate lod)
  (cond
    [(empty? lod) '()]
    [else
     (cons (* rate (first lod)) (convert_euro* rate (rest lod)))]))

; Test
(check-expect (convert_euro '()) '())
(check-expect (convert_euro (cons 1 '()))
              (cons (* 1 trans_size) '()))
(check-expect (convert_euro (cons 1 (cons 2 '())))
              (cons (* 1 trans_size)(cons (* 2 trans_size) '())))


(check-expect (convert_euro* 0.88859 '()) '())
(check-expect (convert_euro* 0.88859 (cons 1 '()))
              (cons (* 1 0.88859) '()))
(check-expect (convert_euro* 0.88859 (cons 1 (cons 2 '())))
              (cons (* 1 0.88859)(cons (* 2 0.88859) '())))