;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-02_05_02-big_bang_expresion) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)

(define (number->square s)
  (square s "solid" "red"))


(number->square 5)

(number->square 10)

(number->square 20)

;syntax of big-bang expression
;
;(big-bang state-expr clause ...)
;
;clause	 	=	 	(on-tick tick-expr)
; 	 	|	 	(on-tick tick-expr rate-expr)
; 	 	|	 	(on-tick tick-expr rate-expr limit-expr)
; 	 	|	 	(on-key key-expr)
; 	 	|	 	(on-pad pad-expr)
; 	 	|	 	(on-release release-expr)
; 	 	|	 	(on-mouse mouse-expr)
; 	 	|	 	(to-draw draw-expr)
; 	 	|	 	(to-draw draw-expr width-expr height-expr)
; 	 	|	 	(stop-when stop-expr)
; 	 	|	 	(stop-when stop-expr last-scene-expr)
; 	 	|	 	(check-with world?-expr)
; 	 	|	 	(record? r-expr)
; 	 	|	 	(close-on-stop cos-expr)
; 	 	|	 	(display-mode d-expr)
; 	 	|	 	(state expr)
; 	 	|	 	(on-receive rec-expr)
; 	 	|	 	(register IP-expr)
; 	 	|	 	(port Port-expr)
; 	 	|	 	(name name-expr)

(big-bang 100 [to-draw number->square])


(big-bang 100
  [to-draw number->square]
  [on-tick sub1]
  [stop-when zero?])

(define (reset s ke) 100)

(big-bang 100
  [to-draw number->square]
  [on-tick sub1]
  [stop-when zero?]
  [on-key reset])


(define cw1 (ke-h cw0 "a"))



