;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 072_05-exercise-formulate_struct_define) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise : 72
;
;   Formulate a data definition for the above phone structure type definition that accommodates the given examples.
;
;   Next formulate a data definition for phone numbers using this structure type definition:
;
;    (define-struct phone# [area switch num])
;

(define-struct phone [area number])
; A Phone is a structure: (make-phone Number String)
;
; interpretation:  a 3 digit area code and a 7-digit phone number




(define-struct phone# [area swith phone])
; A Phone# is a structure: (make-phone Number Number Number)
;
; interpretation:
;
;      area is a number between 000  and 999
;
;    switch is a number between 000  and 999
;
;     phone is a number between 0000 and 9999
;

; Test
