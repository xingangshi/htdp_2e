;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 078_05-exercise-formulate_struct_3_Letter_word) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 78: 
;
;  Provide a structure type definition and a data definition for representing lower-case three-letter words. A
;
;  word consists of letters, represented with the one-letter strings "a" through "z" plus #false.

(define-struct 3_letter_word [a b c])
; A 3_letter_word is a structure:
;  (make-3_letter_word String String String)
; interpretation:
;  (make-3_letter_word a b c)
; is a 3 letter word where
;  - a / b / c, a one-letter string "a" through "z" plus "#false".