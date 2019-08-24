;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-09_01-make_formulate) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


; List_of_string -> Number
;
; return how many strings alos contains
(define (how_many alos)
  (cond
    [(empty? alos) 0]
    [(cons? alos) (+ 1 (how_many (rest alos)))]
    [else (error "alos must be a cons")]))


; Test
(check-expect (how_many '()) 0)
(check-expect (how_many (cons "a" '())) 1)
(check-expect (how_many (cons "b" (cons "a" '()))) 2)
(check-error (how_many "a") "alos must be a cons")