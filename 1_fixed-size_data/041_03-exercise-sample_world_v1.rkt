;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 041_03-exercise-sample_world_v1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 41: 
;
;   Develop your favorite image of a car so that WHEEL-RADIUS remains the single point of control.
;   Remember to experiment and make sure you can re-size the image easily.
;
; NOTE:
;   the problem is solved by completing exercises 41 through 46.

(require 2htdp/image)
(require 2htdp/universe)


; Physical Constants (general attributes of objects in the world)
(define width_of_world 200)
(define wheel_radius   5)
(define wheel_distance (* wheel_radius 5))

; Graphical Constants (images of objects in the world)
(define wheel (circle    wheel_radius "solid" "black"))
(define SPACE (rectangle (* 4 wheel_radius)
                         wheel_radius
                         "solid"
                         "white"))
(define both_wheels (beside wheel SPACE wheel))
(define background (empty-scene width_of_world (* width_of_world 1/2)))


; WorldState is a Number
;
;   interpretation: the number of pixels between the left border and®
; renderr
;   clock-tick-handler
;   key-stroke-handler
;   mouse-event-handler
;   end?


; WorldState -> Image
;   places the image of the car x pixels from the left margin of the BACKGROUND image
(define (render x) background)


; WorldState -> WorldState
;   adds 3 to x to move the car to the right
(define (tock world_state) (+ world_state 3))


; WorldState -> WorldState
;   launches the program from some initial state
(define (main world_state)
  (big-bang world_state
    [on-tick tock]
    [to-draw render]))


; test
;(render 10)

(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

;(main 13)



