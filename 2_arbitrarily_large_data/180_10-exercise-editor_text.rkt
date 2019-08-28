;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 180_10-exercise-editor_text) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 179:
;
;  Design editor-text without using implode. 
;

(require 2htdp/image) 

(define FONT-SIZE  16)       ; the font size 
(define FONT-COLOR "black") ; the font color

(define (editor_text s)
  (text (cat s) FONT-SIZE FONT-COLOR))

(define (cat s)
  (cond [(empty? s) ""]
        [else (string-append (first s) (cat (rest s)))]))

; Test
(check-expect (editor_text '()) 
              (text "" FONT-SIZE FONT-COLOR))
(check-expect (editor_text (cons "c"(cons "a"(cons "t" '()))))
              (text "cat" FONT-SIZE FONT-COLOR))


(editor_text '())
(editor_text (cons "c"(cons "a"(cons "t" '()))))