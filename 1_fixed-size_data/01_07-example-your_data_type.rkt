;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 01_07-example-your_data_type) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
;(* (+ (string-length 42) 1) pi)

; check value type
(string? 42)
(number? 42)


(rational? pi)

(define input "42")

;(if (string? input) (string-length input)
(cond
  [(string? input) (* (+ (string-length input) 1) pi)]
  [(not (string? input)) "Input must be string"])