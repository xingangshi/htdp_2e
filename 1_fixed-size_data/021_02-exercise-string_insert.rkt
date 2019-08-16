;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 021_02-exercise-string_insert) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (string_insert in_str index)
  (string-append (string-append (substring in_str 0 index) "_")
                 (substring in_str (- (string-length in_str) index) (string-length in_str))))

(string_insert "helloworld" 5)