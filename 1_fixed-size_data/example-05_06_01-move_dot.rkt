;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-05_06_01-move_dot) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Note:
;
;   Your team is designing an interactive game program that moves a red dot across a 100 x 100 canvas
;   and allows players to use the mouse to place the dot. Together you chose Posn as the data representation for the game state. 
;

(require 2htdp/image)
(require 2htdp/universe)

(define MTS (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))


(define (scene_dot p)
  (place-image DOT (posn-x p) (posn-y p) MTS))

(define (x+ p)
  (make-posn (+ (posn-x p) 3) (posn-y p)))

(define (reset_dot p x y me)
  (make-posn x y))

; Posn -> Posn
(define (main p0)
  (big-bang p0
    [on-tick x+]
    [on-mouse reset_dot]
    [to-draw  scene_dot]))

; Test
(check-expect (scene_dot (make-posn 10 20)) (place-image DOT 10 20 MTS))
(check-expect (scene_dot (make-posn 88 73)) (place-image DOT 88 73 MTS))

(check-expect (x+ (make-posn 10 0)) (make-posn 13 0))

(check-expect (reset_dot (make-posn 10 20) 29 31 "button-down") (make-posn 29 31))
(check-expect (reset_dot (make-posn 10 20) 29 31 "button-up") (make-posn 10 20))

(main (make-posn 10 30))