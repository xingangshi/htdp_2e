;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-05_07_01-add_struct_to_a_uninverse) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A BS is one of :
;
; - "Hello",
; - "world", or
; - pi.


(define-struce 

(define-struct ball[location velocity])

; Posn is (make-posn Number Number)
(make-posn (make-ball "hello" 1) #false)

(make-posn (make-ball (make-ball (make-posn 1 2) 3) 4) 5)