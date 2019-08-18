;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 061_04-exercise-traffic_light_v1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 61:
;
;   Finish the design of a world program that simulates the traffic light FSA.

(require 2htdp/image)
(require 2htdp/universe)

(define radius 10)
(define interval_space (/ radius 2))

(define width_bg  (+ (* 6 radius) ( * (+ 4 2) interval_space)))
(define height_bg (+ radius (* (+ 2 2) interval_space)))

(define lights_bg (empty-scene width_bg height_bg))

lights_bg

(define (bulbe on color)
  (if (string=? on color) (circle radius "solid" color)
      (circle radius "outline" color)))


; TrafficLight -> TrafficLight
; yields the next state, given current state cs
(define (tl_next cs)
  (cond
    [(string=? cs "red") "green"]
    [(string=? cs "yellow") "red"]
    [(string=? cs "green") "yellow"]))
 
; TrafficLight -> Image
; renders the current state cs as an image
(define (tl_render cs)
  (place-images
   (list (bulbe cs "red")
         (bulbe cs "yellow")
         (bulbe cs "green"))
   (list (make-posn (+ (* 1 radius) (* 1 interval_space)) (+ radius interval_space))
         (make-posn (+ (* 3 radius) (* 3 interval_space)) (+ radius interval_space))
         (make-posn (+ (* 5 radius) (* 5 interval_space)) (+ radius interval_space)))
   lights_bg))

; TrafficLight -> TrafficLight
;
;   simulates a clock-based American traffic light
(define (traffic_light_simulation initial_state)
  (big-bang initial_state
    [to-draw tl_render]
    [on-tick tl_next 1]))

; Test
 
(traffic_light_simulation "red")
