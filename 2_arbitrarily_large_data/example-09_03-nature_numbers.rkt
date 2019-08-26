;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-09_03-nature_numbers) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


(make-list 2 "hello")

(make-list 3 #true)

(make-list 0 17)

; N String -> List-of-strings
; creates a list of n strings s

(require 2htdp/image)
(require 2htdp/universe)

(define (copier n s)
  (cond
    [(<= n 0) '()]
    [else (cons s (copier (- n 1) s))]))


(define (copier_1 n s) 
  (cond    [(zero? n) '()] 
           [(positive? n) (cons s (copier (sub1 n) s))]))

;

(check-expect (copier 2 "hello") (cons "hello" (cons "hello" '())))
(check-expect (copier 0 "hello") '())
(check-expect (copier 4 0) (cons 0(cons 0(cons 0(cons 0 '())))))
(check-expect (copier 2 (circle 3 "solid" "red"))
              (cons (circle 3 "solid" "red")
                    (cons (circle 3 "solid" "red") '())))


(check-expect (copier_1 2 10.1) (copier 2 10.1))
(check-expect (copier_1 3 "xyz") (copier 3 "xyz"))
(check-expect (copier_1 0 "hello") '())