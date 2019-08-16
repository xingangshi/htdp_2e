;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 046_03-exercise-sample_world_v6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 46: 
;
;   Formulate the examples as BSL tests. Click RUN and watch them fail.
;
; NOTE:
;   the problem is solved by completing exercises 41 through 46.

(require 2htdp/image)
(require 2htdp/universe)


; Physical Constants (general attributes of objects in the world)
(define width_of_world 400)
(define wheel_radius   5)
(define wheel_distance (* wheel_radius 5))

; Graphical Constants (images of objects in the world)
(define wheel (circle    wheel_radius "solid" "black"))
(define space_x (rectangle (* 4 wheel_radius)
                         wheel_radius
                         "solid"
                         "white"))
(define both_wheels (beside wheel space_x wheel))

(define car_x
  (overlay/align/offset
     "center" "top"
     (rectangle (* 4 wheel_radius) wheel_radius "solid" "red")
     0 wheel_radius
     (overlay/align/offset
        "left" "bottom"
        both_wheels
        (* -1 wheel_radius) (* -1 wheel_radius)
        (rectangle (* 10 wheel_radius) (* 2 wheel_radius) "solid" "red"))))



(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define background
  (overlay/xy tree
              (* -0.75 width_of_world) 10
              (empty-scene width_of_world (* wheel_radius 5))))

(define y_car_x (- (image-height background) (* 2 wheel_radius)))


; equate a zero world-state with the rightmost end of the car
(define x_displacment (/ (image-width car_x) -2))


; WorldState -> Image
;   places the image of the car x pixels from the left margin of the BACKGROUND image
(define (render world_state)
  (place-image car_x (+ x_displacment world_state) y_car_x background))


; WorldState -> WorldState
;   adds 3 to x to move the car to the right
(define (tock world_state) (+ world_state 3))

; WorldState -> Boolean
; end the program
(define (done world_state) (= world_state (+ width_of_world (image-width car_x))))


; WorldState Number Number String -> WorldState
;
;   places the car at the x-coordinate if me is "button-down"
(define (hyper x_pos_of_car x_mouse y_mouse me)
  (cond
    [(string=?  "button-down" me) x_mouse]
    [else x_pos_of_car]))

; WorldState -> WorldState
;   launches the program from some initial state
(define (main world_state)
  (big-bang world_state
    [on-tick   tock]
    [on-mouse  hyper]
    [to-draw   render]
    [stop-when done]))


; test
;(render 10)

(check-expect (hyper 21 10 20 "center") 21)

(check-expect (hyper 42 10 20 "button-down") 10)

(check-expect (hyper 42 10 20 "move") 42)

(main 1)



