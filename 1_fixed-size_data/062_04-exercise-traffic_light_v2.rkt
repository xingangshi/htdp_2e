;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 062_04-exercise-traffic_light_v2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 62:
;
;   An alternative data representation for a traffic light program may use
;   numbers instead of strings:
;     An N-TrafficLight is one of:
;     – 0 interpretation the traffic light shows red
;     – 1 interpretation the traffic light shows green
;     – 2 interpretation the traffic light shows yellow 


(require 2htdp/image)
(require 2htdp/universe)

(define radius 10)
(define interval_space (/ radius 2))

(define width_bg  (+ (* 6 radius) ( * (+ 4 2) interval_space)))
(define height_bg (+ radius (* (+ 2 2) interval_space)))

(define lights_bg (empty-scene width_bg height_bg))

(define (bulbe on color)
  (if (= on color)
      (cond
        [(= color 0) (circle radius "solid" "red")]
        [(= color 1) (circle radius "solid" "green")]
        [(= color 2) (circle radius "solid" "yellow")])
      (cond
        [(= color 0) (circle radius "outline" "red")]
        [(= color 1) (circle radius "outline" "green")]
        [(= color 2) (circle radius "outline" "yellow")])))

; TrafficLight -> TrafficLight
; yields the next state, given current state cs
(define (tl_next cs)
  (modulo (+ cs 1) 3))
 
; TrafficLight -> Image
; renders the current state cs as an image
(define (tl_render cs)
  (place-images
   (list (bulbe cs 0)
         (bulbe cs 1)
         (bulbe cs 2))
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
(traffic_light_simulation 0)
