;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 068_05-exercise-new_balls) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise : 68
;
;   There are other ways to represent bouncing balls. Here is one:
;
;     (define SPEED 3)
;     (define-struct balld [location direction])
;     (make-balld 10 "up")
;
;   Interpret this program fragment and then create other instances of balld.
;

(define-struct vel [deltax deltay])

(define-struct loc [x_pos  y_pos])

(define-struct ball [location vertical])

; Test
(define localtion (make-loc 30 40))
(define vertical  (make-vel -10 5))

(define ball1 (make-ball localtion vertical))

(ball-location ball1)
(loc-x_pos (ball-location ball1))
(loc-y_pos (ball-location ball1))

(ball-vertical ball1)
(vel-deltax (ball-vertical ball1))
(vel-deltay (ball-vertical ball1)) 