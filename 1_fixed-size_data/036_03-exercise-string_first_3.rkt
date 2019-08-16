;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 036_03-exercise-string_first_3) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 36. 
;   Design the function string-first, which extracts the first character from a
;   non-empty string. Don’t worry about empty strings.

; Name     : string_first

; Func     : String -> String, returns the first character from a non-empty string.
;
; Given    : "hello"
;
; Expected : 'h'
; 
(define (string_first in_str)
  (cond
    [(> (string-length in_str) 0) (string-ith in_str 0)]
    [else ""]))

;test
(string_first "hello")
(string_first "")