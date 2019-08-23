;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 120_BSL-exercise-04) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 120:
;
;   Explain why the following sentences are syntactically illegal

1. (define (f "x") x)
2. (define (f x y z) (x))
3. (define (f) 10)