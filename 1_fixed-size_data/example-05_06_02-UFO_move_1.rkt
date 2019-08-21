;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-05_06_02-UFO_move_1) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Note:
;
;   Your team is designing a game program that keeps track of an object that
;   moves across the canvas at changing speed. The chosen data representation 
;   requires two data definitions: velocity and ufo.
;   Design the function move1, which moves some given UFO for one clock tick.
;

(define-struct vel [deltax deltay])

; A UFO is a structure: (make-ufo Posn Vel)
; interpretation (make-ufo p v) is at location p moving at velocity v
; For Vel, see above.
(define-struct ufo [location velocity])


; UFO -> UFO
; determines where u moves in one clock tick;
; leaves the velocity as is
(define (ufo_move_1 u)
  (make-ufo
   (make-posn (+ (posn-x (ufo-location u))
                 (vel-deltax (ufo-velocity u)))
              (+ (posn-y (ufo-location u))
                 (vel-deltay (ufo-velocity u))))
   (make-vel (vel-deltax (ufo-velocity u))
             (vel-deltay (ufo-velocity u)))))
            

; Posn Vel -> Posn
; adds v to p
(define (posn+ p v)
  (make-posn (+ (posn-x p) (vel-deltax v))
             (+ (posn-y p) (vel-deltay v))))

; Test
(define v1 (make-vel  8 -3))
(define v2 (make-vel  -5 -3))
(define p1 (make-posn 22 80))
(define p2 (make-posn 30 77))
(define u1 (make-ufo  p1 v1))
(define u2 (make-ufo  p1 v2))
(define u3 (make-ufo  p2 v1))
(define u4 (make-ufo  p2 v2))

(check-expect (ufo_move_1 u1) u3)
(check-expect (ufo_move_1 u2) (make-ufo (make-posn 17 77) v2))

(check-expect (posn+ p1 v1) p2)
(check-expect (posn+ p1 v2) (make-posn 17 77))
