;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 114_06-exercise-predicates_definitions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise: 114
;
;  Design predicates for the following data definitions from the preceding section: SIGS, Coordinate (exercise 107), and VAnimal.


(define-struct tank [loc vel])

; Any -> Boolean
; returns true if s is a SIGS, otherwise, returns false
(define (sigs_or_not? s)
  (cond
    [(posn? s) true]
    [(tank? s) true]
    [else      false]))

; A Coordinate is one of: 
; – a negative number 
;    interpretation a point on the Y axis, distance from top
; – a positive number 
;    interpretation a point on the X axis, distance from left
; – a Posn
;    interpretation a point in a scene, usual interpretation

; Any -> Boolean
; returns true if c is a coordinate, otherwise, returns false
(define (coord_or_not? c)
  (cond
    [(number? c) true]
    [(posn?   c) true]
    [else false]))

; A VAnimal is either
; – a VCat
; – a VCham

(define-struct vcat [xpos hnum dir])
(define-struct vcham [xpos hnum dir colour])

; Any -> Boolean
; returns true of v is a VAnimal, otherwise, returns false


(define (vanimal_or_not? v)
  (cond
    [(vcat?  v) true]
    [(vcham? v) true]
    [else false]))

; Test
(check-expect (sigs_or_not? (make-posn 3 10)) true)
(check-expect (sigs_or_not? (make-tank 50 1)) true)
(check-expect (sigs_or_not? "hello") false)

(check-expect (coord_or_not? 9) true)
(check-expect (coord_or_not? -1) true)
(check-expect (coord_or_not? "a") false)

(check-expect (coord_or_not? (make-posn 1 2)) true)

(check-expect (vanimal_or_not? (make-vcat 3 100 1)) true)
(check-expect (vanimal_or_not? (make-vcham 10 50 1 "red")) true)
(check-expect (vanimal_or_not? "cat") false)