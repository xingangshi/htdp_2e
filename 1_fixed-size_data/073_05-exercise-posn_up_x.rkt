;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 073_05-exercise-posn_up_x) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise : 73
;
;   Design the function posn-up-x, which consumes a Posn p and a Number n. It produces a Posn like p with n in the x field.
;
;   A neat observation is that we can define x+ using posn-up-x:
;
;    (define (x+ p)
;      (posn-up-x p (+ (posn-x p) 3)))   
;
;   Note Functions such as posn-up-x are called updaters functional setters. They are extremely useful when you write large programs.
;

(define (posn-up-x p n)
  (make-posn n (posn-y p)))

(define (x+ p)
  (posn-up-x p (+ (posn-x p) 3)))

 
; Test
(x+ (make-posn 10 20))