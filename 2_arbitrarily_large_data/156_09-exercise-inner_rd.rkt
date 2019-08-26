;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 156_09-exercise-inner_rd) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 156:
;
;   Design the function inner, which consumes an RD and produces the (color of the) innermost doll. Use DrRacket’s stepper to evaluate (inner rd) for you favorite rd.
;


(define-struct layer [color doll])

(define (inner an-rd) 
  (cond    [(string? an-rd) an-rd]  
           [(layer? an-rd) (inner (layer-doll an-rd))]))


; Test

(inner "red")

(check-expect (inner "red") "red")

(inner (make-layer "yellow" (make-layer "green" "red")))


(check-expect (inner (make-layer "yellow" (make-layer "green" "red"))) 
              "red")


