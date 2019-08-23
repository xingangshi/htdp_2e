;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 132_09-exercise-list_of_boolean) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 132:
;
;   Provide a data definition for representing lists of Boolean values. The class contains all arbitrarily long lists of Booleans. 


; A list_of_booleans is one of:
;
;   – '()
;   – (cons Boolean list_of_booleans)
;
; interpretation a list_of_booleans represents a true and/or false values.

(cons #true
      (cons #false
            '()))
