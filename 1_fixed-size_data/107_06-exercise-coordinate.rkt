;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 107_06-exercise-coordinate) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 107:
;
;   Some program contains the following data definition:
;
;   A Coordinate is one of:
;
;     – a NegativeNumber 
;       interpretation on the y axis, distance from top
;     – a PositiveNumber 
;       interpretation on the x axis, distance from left
;     – a Posn
;       interpretation an ordinary Cartesian point
;
;   Make up at least two data examples per clause in the data definition. For each of the examples, explain its meaning with a sketch of a canvas.
;

; Examples
(define nn1 -10)
(define nn2 -2)

(define pn1 10)
(define pn2 30)

(define pos1 (make-posn -1 10))
(define pos2 (make-posn 10 -3))