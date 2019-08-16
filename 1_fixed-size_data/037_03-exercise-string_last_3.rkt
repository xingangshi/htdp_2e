;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 037_03-exercise-string_last_3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 37. 
;   Design the function string-last, which extracts the last character from a non-empty string.

; Name     : string_last

; Func     : String -> String, returns the last character from a non-empty string.
;
; Given    : "hello"
;
; Expected : 'o'
; 

(define (string_last  in_str)
  (cond
    [(> (string-length in_str) 0) (string-ith in_str (- (string-length in_str) 1))]
    [else ""]))

; test
(string_last "hello")
(string_last "")