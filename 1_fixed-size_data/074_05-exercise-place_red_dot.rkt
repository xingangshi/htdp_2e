;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 074_05-exercise-place_red_dot) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 74:
;
;   Copy all relevant constant and function definitions to DrRacket’s definition area.
;   Add the tests and make sure they pass. Then run the program and use the mouse to place the red dot.
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
  (cond
    [(mouse=? me "button-down") (make-posn x y)]
    [else p]))

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