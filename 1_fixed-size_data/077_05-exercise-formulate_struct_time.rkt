;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 077_05-exercise-formulate_struct_time) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 77: 
;
;  Provide a structure type definition and a data definition for representing points in time since midnight. A
;
;  point in time consists of three numbers: hours, minutes, and seconds.

(define-struct time [hour minutes seconds])
; A time is a structure:
;  (make-time Number Number Number)
; interpretation:
;  (make-time hour minutes seconds)
; is a point in time from midnight where
;  - hour, a number between 0 and 23, with 0 hours representing midnight;
;  - minutes, a number between 0 and 59;
;  - seconds, a number between 0 and 59.