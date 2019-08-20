;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 067_05-exercise-more_define_struct) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise : 67
;
;   Write down the names of the functions (constructors, selectors, and predicates) that the following structure type definitions introduce:
;   Make sensible guesses as to what kind of values go with which fields. Then create at least one instance per structure type
;   definition and draw box representations for them.

;
(define-struct movie [title producer year])

(define-struct persion [name age sex])

(define-struct pet [name number])

(define-struct CD [artist title price])

(define-struct sweater [material size producer])

(define-struct ball [location velocity])

; Test
(define one_ball (make-ball 10 3))

(ball-location one_ball)
(ball-velocity one_ball)