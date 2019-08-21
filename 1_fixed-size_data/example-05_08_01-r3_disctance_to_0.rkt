;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-05_08_01-r3_disctance_to_0) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Note: 
;

(define-struct r3 [x y z])
; R3 is (make-r3 Number Number Number)

; R3 -> Number
; determines the distance of p to the origin
(define (r3_distance_to_0 p)
  (sqrt(+ (+ (expt (r3-x p) 2) (expt (r3-y p) 2)) (expt (r3-z p) 2))))


; Test
(define ex1 (make-r3 1 2 13))
(define ex2 (make-r3 -1 0 3))

(r3_distance_to_0 (make-r3  1 2 3))