;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 015_02-exercise-get_string_first) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (get_string_first in_string)
  (cond
    [(> (string-length in_string) 0) (substring in_string 0 1)]
    [else "empty string"]))

;test
(get_string_first "hello")
(get_string_first "")