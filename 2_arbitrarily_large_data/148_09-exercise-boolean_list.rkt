;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 148_09-exercise-boolean_list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 148:
;
;     Develop a data definition for NEList-of-Booleans, a representation of non-empty lists
;     of Boolean values. Then re-design the functions all-true and one-true from exercise 141.
;

(define (all_true b_list)
  (cond
    [(empty? (rest b_list)) (first b_list)]
    [(cons? (rest b_list))
     [(first b_list) (all_true (rest b_list))]
     [else false]]))

(define (one_true b_list)
  (cond
    [(empty? (rest b_list)) (first b_list)]
    [(cons? (rest b_list))
     (cond
       [(first b_list) true]
       [else (one_true (rest b_list))])]))
  

; Test
(check-expect (all_true (cons true (cons true (cons true '())))) true)
(check-expect (all_true (cons true (cons false (cons true '())))) false)
(check-expect (all_true (cons false '())) false)
(check-expect (all_true (cons true '())) true)

(check-expect (one_true (cons false (cons false (cons false '())))) false)
(check-expect (one_true (cons false (cons true (cons false '())))) true)
(check-expect (one_true (cons false '())) false)
(check-expect (one_true (cons true '())) true)