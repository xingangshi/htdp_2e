;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 137_09-exercise-cons_step_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 137:
;
; Validate with DrRacket’s stepper
;
;   (our-first (our-cons "a" '())) == "a"
;   (our-rest (our-cons "a" '())) == '()
;
; See What Is '(), What Is cons for the definitions of these functions. 

(define-struct pair [left right])

(define (our_cons a_value a_list)
  (make-pair a_value a_list))


(define (our_first our_cons)
  (pair-left our_cons))

(define (our_rest our_cons)
  (pair-right our_cons))

; Test
(check-expect (our_first (our_cons "a" '())) "a")
(check-expect (our_rest  (our_cons "a" '())) '())