;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 025_02-exercise-get_string_first_2) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (string_first in_str)
  (substring in_str 0 1))

(string_first "hello")

(define (string_first_1 in_str)
  (string-ith in_str 0))

(string_first_1 "hello")