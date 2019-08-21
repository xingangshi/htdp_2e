;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 081_05-exercise-time_to_seconds) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 81: 
;
;  Design the function time->seconds, which consumes instances of time structures and produces the number
;  of seconds that have passed since midnight.
;

(define-struct time [hours minutes seconds])


(define (time_to_seconds time_in)
  (+ (time-seconds time_in)
     (* (+ (* (time-hours time_in) 60)
           (time-minutes time_in)) 60)))

; Test
(check-expect (time_to_seconds (make-time 12 30 2)) 45002)