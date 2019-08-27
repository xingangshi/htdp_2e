;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-10_01-func_produce_list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


; Number -> Number
;
; computer the wage for h hour of work

(define (wage h)
  (* 12 h))


; List-of-numbers -> List-of-numbers
;
; computes the weekly wages for all given weekly hours

(define (wage* alon)
  (cond
    [(empty? alon) '()]
    [else (cons (wage (first alon)) (wage* (rest alon)))]))

; Test
(check-expect (wage* '()) '())
(check-expect (wage* (cons 28 '())) (cons 336 '()))

(check-expect (wage* (cons 4 (cons 2 '()))) (cons 48 (cons 24 '())))
 