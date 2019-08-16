;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 011_01-exercise-converts_all) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)

(define input "hello")

(define (converts_all input)
  (cond
    [(string? input) (string-length input)]
    [(image? input)   (* (image-width input) (image-height input))]
    [(and (number? input) (> input 0)) (- input 1)]
    [(and (number? input) (<= input 0)) input ]
    [(and (boolean? input) input) 10]
    [(and (boolean? input) (not input)) 20]))

; for test

(converts_all input)

(converts_all (rectangle 10 20 "solid" "black"))

(converts_all 111)
(converts_all 0)
(converts_all -1)

(converts_all #true)
(converts_all #false)