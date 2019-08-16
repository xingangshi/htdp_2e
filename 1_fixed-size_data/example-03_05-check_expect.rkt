;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-03_05-check_expect) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Name     : f2c
;
; Func     : Number -> Number, returns [5/9 * (in_num - 32)].
;
; Given    : 1. 32    2. 212    3. -40
;
; Expected : 1. 0     2. 100    3. -40
;

(require 2htdp/image)

(define (f2c in_num)
  (* 5/9 (- in_num 32)))


; test
(check-expect (f2c 32) 0)

(check-expect (f2c 212) 100)

(check-expect (f2c -40) -40)

