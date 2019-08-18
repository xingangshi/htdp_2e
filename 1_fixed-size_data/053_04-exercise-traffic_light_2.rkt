;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 053_04-exercise-traffic_light_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 53:
;
;   Design a big-bang program that simulates a traffic light for a given duration. The program renders the state of a traffic light as a solid circle of the
;   appropriate color, and it changes state on every clock tick. 
;
; Name : traffic_light_next

(require 2htdp/image)
(require 2htdp/universe)

(define radius     10)
(define width_x    (* 3 radius))
(define width_y    width_x)
(define background (empty-scene width_x width_y "black"))

(define (traffic_light_next cur_color)
  (cond
    [(string=? "red"    cur_color) "green"]
    [(string=? "green"  cur_color) "yellow"]
    [(string=? "yellow" cur_color) "red"]))

(define (traffic_light color)
  (circle radius "solid" color))

(define (render color_state)
  (overlay/align "center" "center" (traffic_light color_state) background))

(define (tock color_state)
  (traffic_light_next color_state))
  
(define (auto_traffic_light color_state)
  (big-bang color_state
    [on-tick tock]
    [to-draw render]))

; Test
(check-expect (traffic_light_next "red")    "green")
(check-expect (traffic_light_next "green")  "yellow")
(check-expect (traffic_light_next "yellow") "red")

(traffic_light "red")
(render        "red")
(tock          "red")

(auto_traffic_light "red")

