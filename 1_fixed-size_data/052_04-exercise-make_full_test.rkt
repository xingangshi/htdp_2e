;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 052_04-exercise-make_full_test) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 52:
;
;   Add enough tests to make DrRacket happy.
;
; Name : traffic_light_next

(define (traffic_light_next cur_color)
  (cond
    [(string=? "red"    cur_color) "green"]
    [(string=? "green"  cur_color) "yellow"]
    [(string=? "yellow" cur_color) "red"]))

; Test
(check-expect (traffic_light_next "red")    "green")
(check-expect (traffic_light_next "green")  "yellow")
(check-expect (traffic_light_next "yellow") "red")