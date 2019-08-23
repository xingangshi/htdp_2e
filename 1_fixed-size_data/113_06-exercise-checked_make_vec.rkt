;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 113_06-exercise-checked_make_vec) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise: 113
;
;   Develop the function checked-make-vec, which is to be understood as a checked version
;   of the primitive operation make-vec. It ensures that the arguments to make-vec are
;   positive numbers. In other words, checked-make-vec enforces our informal data definition. 
;


(define-struct vec [x y])
; A vec is
;   (make-vec PositiveNumber PositiveNumber)
; interpretation represents a velocity vector


(define (checked_make_vec x y)
  (cond
    [(and (number? x) (>= x 0)
          (number? y) (>= y 0)) (make-vec x y)]
    [else (error "make-vec : x and y must be positive numbers")]))


; Test

(check-expect (checked_make_vec 3 3) (make-vec 3 3))
(check-error  (checked_make_vec "a" 1)
              "make-vec : x and y must be positive numbers")
(check-error  (checked_make_vec -1 3)
              "make-vec : x and y must be positive numbers")