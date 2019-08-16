;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 039_03-exercise-string_rest) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 39. 
;   Design the function string-rest, which produces a string like the given one with the first character removed.

; Name     : string_rest

; Func     : String -> String, returns a string that the first character removed.
;
; Given    : "hello"
;
; Expected : "ello"
;

(define (string_rest in_str)
  (cond
    [(> (string-length in_str) 0) (substring in_str 1 (string-length in_str))]
    [else in_str]))

(string_rest "hello")
(string_rest "")