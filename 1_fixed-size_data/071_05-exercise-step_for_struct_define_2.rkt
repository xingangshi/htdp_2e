;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 071_05-exercise-step_for_struct_define_2) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise : 71
;
;   Explain the results with step-by-step computations. Double-check your computations with DrRacket’s stepper.
;

(define height 200)

(define middle (quotient height 2))
(define width 400)
(define center (quotient width 2))

(define-struct game [left_player right_player ball])

; Test
(define game_0 (make-game middle middle (make-posn center center)))

(game-ball game_0)

(posn? (game-ball game_0))

(game-left_player game_0)