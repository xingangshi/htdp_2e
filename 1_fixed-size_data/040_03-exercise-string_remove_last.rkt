;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 040_03-exercise-string_remove_last) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 40. 
;   Design the function string-remove-last, which produces a string like the given one with the last character removed.

; Name     : string_remove_last

; Func     : String -> String, returns a string that the last character removed.
;
; Given    : "hello"
;
; Expected : "hell"
;

(define (string_remove_last in_str)
  (cond
    [(> (string-length in_str) 0) (substring in_str 0 (- (string-length in_str) 1))]
    [else in_str]))

; test
(string_remove_last "hello")
(string_remove_last "")