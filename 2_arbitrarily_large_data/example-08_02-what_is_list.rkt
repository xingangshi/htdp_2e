;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-08_02-what_is_list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 

; Any -> Boolean
;
; is the given value '()

;(define (empty? x) ...) ; check the value is a list

(empty? '())

(empty? 1)

(empty? "zhang")

(empty? (cons "zhang" '()))

(empty? (make-posn 1 1))

(define-struct pair [left right])

; A ConsPair is a structure:
;
;   (make-pair Any Any).
;
; Any Any -> ConsPair
(define (our_cons a_value a_list)
  (make-pair a_value a_list))

; A ConsOrEmpty is one of: 
;   – '()
;   – (make-pair Any ConsOrEmpty)
; interpretation ConsOrEmpty is the class of all lists
;
; Any Any -> ConsOrEmpty

(define (our_cons_v2 a_value a_list)
  (cond
    [(empty? a_list) (make-pair a_value a_list)]
    [(pair?  a_list) (make-pair a_value a_list)]
    [else (error "cons : second argument must be a list")]))

; ConsOrEmpty -> Any
;
; extracts the left part of the given pair
(define (our_first a_list)
  (if (empty? a_list)
      (error 'our-first "...")
      (pair-left a_list)))

;Test

(cons 1 (cons 2 '()))

(our_cons "colors" (cons "red" (cons "green" (cons "blue" '()))))
