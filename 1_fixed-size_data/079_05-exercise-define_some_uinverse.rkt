;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 079_05-exercise-define_some_uinverse) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 79: 
;
;  Create examples for the following data definitions:
;
;  The last definition is an unusual itemization, using both built-in data
;  and a structure type definition. The next chapter deals with this kind of data definition in depth.

(define-struct Color [color_type])
; A Color is one of:
; — "white"
; — "yellow"
; — "orange"
; — "green"
; — "red"
; — "blue"
; — "black"


(define H [number say_info])
; H (a “happiness scale value”) is a number in [0, 100],
; i.e., a number between 0 and 100

(define-struct person [fstname lstname male?])
; Person is (make-person String String Boolean)

(define-struct dog [owner name age happiness])
; Dog is (make-dog Person String PositiveInteger H)


(define-struct Weapon [missile? flight])
; Weapon is one of:
; — #false
; — Posn
; interpretation #false means the missile hasn't been fired yet;
; an instance of Posn means the missile is in flight
