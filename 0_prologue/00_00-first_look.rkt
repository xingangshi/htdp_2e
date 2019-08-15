;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 0_0_first_look) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; string-append like +, can deal with as many operands as you wish
(string-append "hello" " " "world")

(+ (string-length "hello world") 20)

(number->string 100)

(string->number "100")

(string->number "hello")

(and #true #false)
(or  #true #false)
(not #true)

(< 10 9)
(> -1 0)
(= 42 9)

; Function define:
;  1. (define (Function_name Input_argvs) Body_Expression)
;
;  2. (Function_name Argument_expression)

; Condtion expression:
;  (cond
;    [Conditon_expression_1 Result_expression_1]
;    [Conditon_expression_2 Result_expression_2]
;    ...
;    [Conditon_expression_n Result_expression_n]


(define (sign x)
  (cond
    [(> x 0) 1]
    [(= x 0) 0]
    [(< x 0) -1]))

(sign 100)
(sign 0)
(sign -2)

; A constant definition:
;  (define Name Expression)

(define PI 3.1415)
PI