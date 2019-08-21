;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-05_09_01-space_game_structure) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Note:
;

(define-struct space_game [ufo tank])
; SpaceGame is (make-space-game Posn Number).
;
; interpretation:
;
;  (make-space-game (make-posn ux uy) tx) means that the
;
; UFO is currently at (ux, uy) and the tank's x-coordinate is tx

; Test
(make-space_game (make-posn 100 200) -100)